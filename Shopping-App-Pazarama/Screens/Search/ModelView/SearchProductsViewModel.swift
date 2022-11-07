//
//  SearchViewModel.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 6.11.2022.
//

import Foundation
import ShoppingAppAPI

protocol SearchProductsViewModelDelegate: AnyObject {
    func didErrorOccured(_ error: Error)
    func didFetchProducts()
}

protocol SearchProductsViewModelProtocol {
    var delegate: SearchProductsViewModelDelegate? { get set }
    var numberOfRows: Int { get }
    func photoForIndexPath(_ indexPath: IndexPath) -> Product?
    func titleForRow(_ row: Int) -> String?
    var products: [Product] { get }
    func fetchProducts()
    
  
}

final class SearchProductsViewModel: SearchProductsViewModelProtocol {
    func photoForIndexPath(_ indexPath: IndexPath) -> Product? {
        products[indexPath.row]
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
    }
    
    var delegate: SearchProductsViewModelDelegate?
    
    
    var products = [Product]() {
        didSet {
             delegate?.didFetchProducts()
        }
    }
    
    var numberOfRows: Int {
        products.count
    }
    
    func fetchProducts() {
        fakeStoreServiceProvider.request(.getProducts) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.didErrorOccured(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data )
                    self?.products = products
                    print(self?.numberOfRows)
                    print(products.count)
                } catch  {
                    self?.delegate?.didErrorOccured(error)
                }
                
            }
        }
    }
}
