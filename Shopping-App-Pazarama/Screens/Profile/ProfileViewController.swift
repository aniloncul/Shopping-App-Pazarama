//
//  ProfileViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, AlertPresentable {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
    }

    @IBAction func logOutButton(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            self.parent?.navigationController?.popViewController(animated: true)
            
        
        } catch  {
            showAlert(title: "Error", message: "Couldn't logout!")
            
        }
        
    }
}
