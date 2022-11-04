//
//  AuthViewModel.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 30.10.2022.
//

import Foundation
import FirebaseAuth
import FirebaseRemoteConfig
import FirebaseFirestore

protocol AuthViewModelProtocol {
    func signUp(email: String?, password: String?)
    func signIn(email: String?, password: String?)
}

enum AuthViewModelChange {
    case didErrorOccurred(_ error: Error)
    case didSignUpSuccessful
    
}

class AuthViewModel: AuthViewModelProtocol {
    func signUp(email: String?, password: String?) {
        guard let email = email, let password = password else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.changeHandler?(.didErrorOccurred(error))
                return
            }
        }
        
    }
    
    func signIn(email: String?, password: String?) {
        guard let email = email,
              let password = password else {
            return
        }
        
        Auth.auth().signIn(withEmail: email,
                           password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                self?.changeHandler?(.didErrorOccurred(error))
                return
            }
        }
    }
    
    func fetchRemoteConfig(completion: @escaping (Bool) -> Void) {
            let remoteConfig = RemoteConfig.remoteConfig()
            let settings = RemoteConfigSettings()
            settings.minimumFetchInterval = 0
            remoteConfig.configSettings = settings
            remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
            
            remoteConfig.fetch { (status, error) -> Void in
                if status == .success {
                    remoteConfig.activate { _, error in
                        
                        if let error = error {
                            self.changeHandler?(.didErrorOccurred(error))
                            return
                        }
                        
                        let isSignUpDisabled = remoteConfig.configValue(forKey: "isSignUpDisabled").boolValue
                        DispatchQueue.main.async {
                            completion(isSignUpDisabled)
                        }
                    }
                } else {
                    guard let error = error else {
                        return
                    }
                    self.changeHandler?(.didErrorOccurred(error))
                }
            }
        }
    
    private let db = Firestore.firestore()
    private let defaults = UserDefaults.standard
    
    var changeHandler: ((AuthViewModelChange) -> Void)?
    
    
   
}
