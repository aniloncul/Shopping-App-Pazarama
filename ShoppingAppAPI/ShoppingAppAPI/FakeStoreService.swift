//
//  FakeStoreService.swift
//  ShoppingAppAPI
//
//  Created by Anıl Öncül on 1.11.2022.
//

import Foundation
import Moya

public let fakeStoreServiceProvider = MoyaProvider<FakeStoreService>()

public enum FakeStoreService {
    case getProducts
}
    

extension FakeStoreService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://fakestoreapi.com")!
    }
    
    public var path: String {
        switch self {
        case .getProducts:
            return "/products"
            
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        switch self {
        case .getProducts:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    
}

