//
//  SheetViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 4.11.2022.
//

import UIKit
import Kingfisher
import FirebaseStorage
import SDWebImage
import Firebase

final class ProductSheetViewController: UIViewController, AlertPresentable {
    //MARK: - Properties
    let sheetViewModel = ProductSheetViewModel()
    
    var product: Product?
    

    @IBOutlet private weak var sheetImageView: UIImageView!
    @IBOutlet private weak var sheetTitleLabel: UILabel!
    @IBOutlet private weak var sheetPriceLabel: UILabel!
    @IBOutlet private weak var sheetStepperController: UIStepper!
    @IBOutlet weak var sheetCountLabel: UILabel!
    
    

    var stepper: UIStepper {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(update(_:)), for: .valueChanged)
        return stepper
    }
    
    var count: String {
        return sheetCountLabel.text!
    }
    
   
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        update(stepper)
        guard let product = product else {return}
        guard let price = product.price else { return }
        
        sheetImageView.sd_setImage(with: URL(string: product.image!))
        sheetTitleLabel.text = product.title
        sheetPriceLabel.text = "\(price)$"
        
    }
    
    @IBAction func addToBasketButton(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        addToFireBase()
    
    }
    
    
    
    
    func addToFireBase() {
    
        
        let firestoreDatabase = Firestore.firestore()
        
        let firestoreProduct = ["count" : count, "price": sheetPriceLabel.text, "title": sheetTitleLabel.text, "username": Auth.auth().currentUser!.email, "image_url" : product?.image]
        
        firestoreDatabase.collection("Product").addDocument(data: firestoreProduct as [String : Any]) { [weak self]
            (error) in
            if error != nil {
                self?.showAlert(title: "Error", message: "Please try again.")
            } else {
                self?.showAlert(title: "Success", message: "Your items are added to basket.")
            }
        }
    }
    
    @IBAction func update(_ sender: UIStepper) {
        guard let price = product?.price else { return }
        sheetCountLabel.text = "\(sender.value)"
        sheetPriceLabel.text = "\(sender.value * price)$"
        
        
       
    }
    
}



