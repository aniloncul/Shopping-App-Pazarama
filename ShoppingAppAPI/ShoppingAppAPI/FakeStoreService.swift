//
//  FakeStoreService.swift
//  ShoppingAppAPI
//
//  Created by Anıl Öncül on 1.11.2022.
//

import Foundation
import Moya

public let fakeStoreServiceProvider = MoyaProvider<FakeStoreService>()

public enum FakeStoreService: String {
    case getProducts = "All"
    case getJewelery = "Jewelery"
    case getElectronics = "Electronics"
    case getMens = "Men\'s"
    case getWomens = "Women\'s"
}
    

extension FakeStoreService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://fakestoreapi.com")!
    }
    
    public var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getJewelery:
            return "/products/categories/jewelery"
        case .getElectronics:
            return "/products/categories/electronics"
        case .getMens:
            return "/products/categories/men's clothing"
        case .getWomens:
            return "/products/categories/women's clothing"
            
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    
}

