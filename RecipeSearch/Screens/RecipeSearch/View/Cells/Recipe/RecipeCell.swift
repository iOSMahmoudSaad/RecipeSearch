//
//  RecipeCell.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit
import SDWebImage
class RecipeCell: UITableViewCell,RecipeTableViewCellProtocol {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeHealthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedCelll()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func roundedCelll() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.6876839995, green: 0.3238169551, blue: 0.8700467348, alpha: 1)
    }
    func configure(recipe: RecipeData) {
        self.recipeTitleLabel.text = recipe.label
        self.recipeSourceLabel.text = recipe.source
        self.recipeHealthLabel.text = recipe.healthLabels.joined(separator: "  |  ")
        self.recipeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.recipeImageView.sd_setImage(with: URL(string: recipe.image))
        
    }
    
}
