//
//  RecipeSearchpPresenter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
class RecipeSearchPresenter: RecipeSearchPresenterProtocol {
    
    //MARK:- Variables
    private weak var view: RecipeSearchViewProtocol?
    private var router: RecipeSearchRouterProtocol
    private var interactor: RecipeSearchInputProtocol
    private var recipes: [Recipe]
    private var filtersArray: [Filter] = [.ALL,.LowSugar,.Keto,.Vegan]
    var numberOfFilters: Int {
        return filtersArray.count
    }
    var numberOfRecipes: Int {
        return recipes.count
    }
    
    //MARK:- init
    init (view: RecipeSearchViewProtocol, router: RecipeSearchRouterProtocol, interactor: RecipeSearchInputProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.recipes = []
    }
    
    
    //MARK:- get recipes
    func getRecipes(searchText: String, filter: String?) {
        guard let view = view else {return}
        view.showLoadingIndicator()
        let searchTextWithoutSpaces = searchText.removeEmptySpace()
        if searchTextValidation(searchTextWithoutSpaces)
        {
            //add to history
            interactor.saveSearchText(searchTextWithoutSpaces)
            //get recipes
            interactor.getRecipes(searchText: searchTextWithoutSpaces, filter: filter)
        }
        
    }
    //MARK:- recipe details
    func selectedRecipeRow(at indexPath: IndexPath) {
        let recipe = recipes[indexPath.row].recipe
        
        router.showRecipeDetails(of: recipe)
    }
    
    
    //MARK:- Search text validation
    func searchTextValidation(_ searchText: String)-> Bool {
        if searchText.isEmpty && view != nil{
            router.showAlert(with: "Attention,empty spaces are not allowed")
            view?.failedData()
            return false
        }
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 ].*", options: [])
            let englishRegex =  regex.firstMatch(in: searchText, options: [], range: NSMakeRange(0, searchText.count))
            if englishRegex != nil && view != nil{
                router.showAlert(with : "Attention,only english letters and spaces are allowed")
                view?.failedData()
                return false
            }
            else {
                return true
            }
        }
        catch {
            return false
            
        }
    }
    
    //MARK:- cells configuration
    func configureFilterCell(cell: FilterCollectionViewCellProtocol,indexPath: IndexPath) {
        cell.configure(filter: filtersArray[indexPath.row])
    }
    func configureRecipeCell(cell: RecipeTableViewCellProtocol, indexPath: IndexPath) {
        cell.configure(recipe: recipes[indexPath.row].recipe)
    }
    //MARK:- selected filter
    func getFilterName(at indexPath: IndexPath)-> String?
    {
        guard let filterName = filtersArray[indexPath.row].healthFilter
        else {return nil}
        return filterName
    }
}
//MARK:- RecipeSearchOutputProtocol
extension RecipeSearchPresenter: RecipeSearchOutputProtocol
{
    
    
    func getFetchedRecipes(recipes: [Recipe]) {
        self.recipes = recipes
        guard let view = self.view else {return}
        view.hideLoadingIndicator()
        view.reloadData()
    }
    func fetchedRecipesFailed() {
        guard let view = self.view else {return}
        view.failedData()
        router.showAlert(with: "An error occurred please try again")
    }
    
}
