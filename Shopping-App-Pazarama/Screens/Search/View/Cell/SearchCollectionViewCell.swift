//
//  SearchCollectionViewCell.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 26.11.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchImageView: UIImageView!
    
    var title: String? {
        didSet{
            searchLabel.text = title
        }
    }
    
    var image: UIImage? {
        didSet{
            searchImageView.image = image
        }
    }
    
    static let identifier = "SearchCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SearchCollectionViewCell", bundle: nil)
    }

}
