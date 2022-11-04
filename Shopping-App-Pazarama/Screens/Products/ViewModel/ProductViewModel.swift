//
//  ProductViewModel.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 1.11.2022.
//

import Foundation
import ShoppingAppAPI
import Kingfisher

protocol ProductViewModelDelegate: AnyObject {
    func didErrorOccured(_ error: Error)
    func didFetchProducts()
}

protocol ProductViewModelProtocol {
    var delegate: ProductViewModelDelegate? { get set }
    var numberOfRows: Int { get }
    func photoForIndexPath(indexPath: IndexPath) -> Product
    func titleForRow(_ row: Int) -> String?
    func fetchProducts()
    var products: [Product] { get }
    
  
}

final class ProductViewModel: ProductViewModelProtocol{
var delegate: ProductViewModelDelegate?

    
    var products = [Product]() {
        didSet {
             delegate?.didFetchProducts()
        }  
    }
    
    var numberOfRows: Int {
        products.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
    }
    
    func photoForIndexPath(indexPath: IndexPath) -> Product {
        products[indexPath.row]
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
