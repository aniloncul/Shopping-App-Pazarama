//
//  User.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import Foundation

struct User: Encodable {
    let username: String?
    let email: String?
    let password: String?
    let basket: [String]?
    }


//
//extension User {
//    init(from dict: [String: Any]) {
//        username = dict[
//    }
//}
//
