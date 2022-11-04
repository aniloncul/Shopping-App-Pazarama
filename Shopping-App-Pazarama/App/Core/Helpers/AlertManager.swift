//
//  AlertManager.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 3.11.2022.
//

import UIKit

protocol AlertPresentable {
     
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String? = nil, message: String? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true)
    }
    
    func showError(_ error: Error) {
        showAlert(title: "Error Occured", message: error.localizedDescription)
    }
}
                                    
