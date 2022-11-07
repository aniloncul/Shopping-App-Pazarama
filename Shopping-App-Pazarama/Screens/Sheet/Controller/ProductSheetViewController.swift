//
//  SheetViewController.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 4.11.2022.
//

import UIKit
import Kingfisher
import FirebaseStorage

protocol SheetViewPresentable {
    var presenterImage: UIImage? { get set }
}

class ProductSheetViewController: UIViewController {
    
    //MARK: - Properties
    var product: Product?

    @IBOutlet weak var sheetImageView: UIImageView!
    
    @IBOutlet weak var sheetTitleLabel: UILabel!
    
    //MARK: - Init

   //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func addToBasketButton(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let basketFolder = storageReference.child("basket")
        
        
        
    }
}



