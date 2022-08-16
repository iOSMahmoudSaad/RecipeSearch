//
//  SearchHistoryTableViewCell.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit

class SearchHistoryTableViewCell: UITableViewCell,SearchHistoryTableViewCellProtocol {

    @IBOutlet weak var searchHistoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func configure(searchHistoryText: String) {
        self.searchHistoryLabel.text = searchHistoryText
    }
    
}
