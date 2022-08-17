//
//  RecipeDetailsProtocols.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 17/08/2022.
//

 
import UIKit

protocol RecipeDetailsViewProtocol: AnyObject {
    func getRecipe(title: String, imageURL: String)
}
protocol RecipeDetailsPresenterProtocol {
    var numberOfIngredients: Int {get}
    func getRecipeData()
    func configureRecipeIngredientsCell(cell: SearchHistoryTableViewCellProtocol, at indexPath: IndexPath)
    func showRecipeWebsite()
    func shareRecipeURL()
    
}
protocol RecipeDetailsRouterProtocol {
    func createModule(with recipe: RecipeData)-> UIViewController
    func showRecipeWebsite(with url: String)
    func shareRecipeURL(with url: String)
}

