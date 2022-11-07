//
//  ProductsCollectionViewCell.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 2.11.2022.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    var title: String? {
        didSet{
            productLabel.text = title
        }
    }
    
    var image: UIImage? {
        didSet{
            productImage.image = image
        }
    }
    
    @IBOutlet  weak var productImage: UIImageView!
    @IBOutlet  weak var productLabel: UILabel!
    
    static let identifier = "ProductsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    }

}
