//
//  TableViewCell.swift
//  Shopping-App-Pazarama
//
//  Created by Anıl Öncül on 7.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellcountLabel: UILabel!
    @IBOutlet weak var cellPriceLabel: UILabel!
    @IBOutlet weak var cellTotalLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
