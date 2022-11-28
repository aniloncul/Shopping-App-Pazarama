//
//  SearchViewModel.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 6.11.2022.
//

import Foundation
import ShoppingAppAPI

enum ProductFetchHandler {
    case didErrorOccurred(_ error: Error)
    case didFetchProduct
}

protocol SearchViewModelProtocol{
    var products: [Product] { get }
    var numberOfRows : Int { get }
    func titleForRow(_ row: Int) -> String?
    func photoForIndexPath(_ indexPath: IndexPath) -> Product?
    func fetchProducts(categorytext: String)
    var changeHandler: ((ProductFetchHandler) -> Void)? { get set }
}

final class SearchProductsViewModel: SearchViewModelProtocol {
    
    var changeHandler: ((ProductFetchHandler) -> Void)?
    
    var products = [Product]() {
        didSet {
            self.changeHandler?(.didFetchProduct)
        }
    }
    
    var numberOfRows: Int {
        products.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
    }
    
    func photoForIndexPath(_ indexPath: IndexPath) -> Product? {
        products[indexPath.row]
    }
    
    //MARK: - Functions
    //Fetch the photos from api
    func fetchProducts(categorytext: String) {
        fakeStoreServiceProvider.request(FakeStoreService(rawValue: categorytext) ?? .getProducts) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.changeHandler?(.didErrorOccurred(error))
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self?.products = products
                } catch {
                    self?.changeHandler?(.didErrorOccurred(error))
                }
            }
        }
    }  
}
