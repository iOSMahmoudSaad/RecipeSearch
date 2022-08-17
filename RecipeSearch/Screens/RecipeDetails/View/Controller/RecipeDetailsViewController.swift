//
//  RecipeDetailsViewController.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 17/08/2022.
//

import UIKit
import SDWebImage
class RecipeDetailsViewController: UIViewController {
    
    //MARK: - variables
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsTableView: UITableView!
    
    var presenter: RecipeDetailsPresenterProtocol!
    var recipeIngredientsTableViewCell: String!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
        self.cellRegisteration()
        self.presenter.getRecipeData()
       
    }
    
    //MARK: - cell registeration
    func cellRegisteration() {
        recipeIngredientsTableViewCell = String(describing: SearchHistoryTableViewCell.self)
        self.recipeIngredientsTableView.register(UINib(nibName: recipeIngredientsTableViewCell, bundle: nil), forCellReuseIdentifier: recipeIngredientsTableViewCell)
    }
    //MARK: - UI configuration
    func configureUIElements() {
         title = "Recipe Details"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6876839995, green: 0.3238169551, blue: 0.8700467348, alpha: 1)
        recipeIngredientsTableView.tableFooterView = UIView()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6876839995, green: 0.3238169551, blue: 0.8700467348, alpha: 1)
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItem = shareButton
    }
    //MARK: - share button
    @objc func shareButtonTapped() {
        self.presenter.shareRecipeURL()
    }
    //MARK: - recipeWebsite button
    
    @IBAction func recipeWebsitebuttonPressed(_ sender: UIButton) {
        self.presenter.showRecipeWebsite()
    }
}
//MARK: - RecipeDetailsViewProtocol
extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
    
    func getRecipe(title: String, imageURL: String) {
        self.recipeTitleLabel.text = title
        self.recipeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.recipeImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
    
    
}
