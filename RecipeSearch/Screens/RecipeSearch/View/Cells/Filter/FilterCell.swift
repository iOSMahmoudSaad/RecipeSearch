//
//  FilterCell.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit

class FilterCell: UICollectionViewCell,FilterCollectionViewCellProtocol {

    @IBOutlet weak var FilterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(filter: Filter) {
        FilterLabel.text = filter.rawValue
    }
    
}
