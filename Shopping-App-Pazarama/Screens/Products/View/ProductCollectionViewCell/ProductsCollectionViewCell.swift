//
//  ProductsCollectionViewCell.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 2.11.2022.
//

import UIKit

final class ProductsCollectionViewCell: UICollectionViewCell {
    
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
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 9.0
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray3
        return imageView
    }()
    
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
