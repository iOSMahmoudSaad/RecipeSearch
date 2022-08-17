//
//  RecipeDetailsRouter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 17/08/2022.
//


import UIKit
import SafariServices
class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    //MARK:- Variables
    private var view: RecipeDetailsViewController
    
    
    //MARK:- init
    init() {
        view = .instantiate(storyboardName: "RecipeDetailsStoryboard")
    }
    
    //MARK:- module creation
    func createModule(with recipe: RecipeData ) -> UIViewController {
        let presenter = RecipeDetailsPresenter(view: view, router: self, recipe: recipe)
        view.presenter = presenter
        return view
    }
    
    //MARK:- present safari
    func showRecipeWebsite(with url: String) {
        guard let url = URL(string: url)
        else {return}
        let safariViewController = SFSafariViewController(url: url)
        self.view.present(safariViewController, animated: true, completion: nil)
        
    }
    
    //MARK:- share url
    func shareRecipeURL(with url: String) {
        guard let recipeURL = URL(string: url) else {return}
        let activityViewController = UIActivityViewController(activityItems: [recipeURL], applicationActivities: nil)
        self.view.present(activityViewController, animated: true, completion: nil)
    }
}
