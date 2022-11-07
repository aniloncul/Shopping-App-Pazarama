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

final class ProductSheetViewController: UIViewController {
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
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(update(_:)), for: .valueChanged)
        return stepper
    }
    
   
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let product = product else {return}
        guard let price = product.price else { return }
        
        sheetImageView.sd_setImage(with: URL(string: product.image!))
        sheetTitleLabel.text = product.title
        sheetPriceLabel.text = "\(price)$"
        
    }
    
    @IBAction func addToBasketButton(_ sender: Any) {
        sheetStepperController.isHidden = false
        sheetCountLabel.isHidden = false
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let basketFolder = storageReference.child("basket")

    }
    
    @IBAction func update(_ sender: UIStepper) {
        guard let price = product?.price else { return }
        print(sender.value)
        sheetCountLabel.text = "\(sender.value)"
        sheetPriceLabel.text = "\(sender.value * price)$"
        
        
       
    }
    
}



