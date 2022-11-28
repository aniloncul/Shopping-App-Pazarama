//
//  ProfileViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 31.10.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, AlertPresentable {
    
    
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet var checkoutLabel: [UILabel]!
    
    var titleLabelArray = [String]()
    var countLabelArray = [String]()
    var priceLabelArray = [String]()
    var totalLabelArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell" )

        title = "Profile"
        fetchFirebaseData()
    }
    
    func fetchFirebaseData() {
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Product").addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            } else {
                snapshot?.isEmpty != true ;
                    for document in snapshot!.documents {
                        let documentId = document.documentID
                        
                        if let count = document.get("count") as? String {
                            self.countLabelArray.append(count)
                        }
                        
                        if let price = document.get("price") as? String {
                            self.priceLabelArray.append(price)
                        }
                        
                        if let title = document.get("title") as? String {
                            self.titleLabelArray.append(title)
                        }
                        
                    }
                
                self.tableView.reloadData()
            }
        }
        
    }

    @IBAction func logOutButton(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            self.parent?.navigationController?.popViewController(animated: true)
            
        
        } catch  {
            showAlert(title: "Error", message: "Couldn't logout!")
            
        }
        
    }
    
    @IBAction func payButton(_ sender: Any) {
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceLabelArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.cellPriceLabel.text = priceLabelArray[indexPath.row]
        cell.cellcountLabel.text = countLabelArray[indexPath.row]
        cell.cellTitleLabel.text = titleLabelArray[indexPath.row]
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
}
