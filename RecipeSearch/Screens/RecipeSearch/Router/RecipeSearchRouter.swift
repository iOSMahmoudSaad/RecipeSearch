//
//  RecipeSearchRouter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit
class RecipeSearchRouter: RecipeSearchRouterProtocol {
  
    
    //MARK:- variables
    private let window: UIWindow
    private var view: UIViewController!
    private var navigationController: UINavigationController
    
    //MARK:- init
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    //MARK:- Application start
    func start() {
        self.createModule()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    //MARK:- module creation
    func createModule() {
        let view: RecipeSearchViewController = .instantiate(storyboardName: "RecipeSearchStoryboard")
        let interactor = RecipeSearchInteractor()
        let presenter = RecipeSearchPresenter(view: view, router: self, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
        let searchHistoryRouter = SearchHistoryRouter().createModule(delegate: view)
        view.searchController = UISearchController(searchResultsController: searchHistoryRouter)
        navigationController.setViewControllers([view], animated: true)
        self.view = view
        
    }
    
   // MARK:- navigation
    func showRecipeDetails(of recipe: RecipeData)
    {
        let recipeDetailsRouter = RecipeDetailsRouter()
            .createModule(with: recipe)
        self.navigationController.pushViewController(recipeDetailsRouter, animated: true)
    }
    //MARK:- Alert
    func showAlert(with message: String )  {
        self.view.showAlert(with: message)
    }
    
}
