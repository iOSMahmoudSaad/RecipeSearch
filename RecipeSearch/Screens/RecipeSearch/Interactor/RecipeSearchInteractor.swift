//
//  RecipeSearchInteractor.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
class RecipeSearchInteractor: RecipeSearchInputProtocol {
    //MARK:- Variables
    var presenter: RecipeSearchOutputProtocol!
    private var worker: RecipeSearchWorker
    private var userDefault: UserDefaults
    
    //MARK:- init
    init() {
        worker = RecipeSearchWorker()
        userDefault = UserDefaults.standard
    }
    
    //MARK:- get recipes
    func getRecipes(searchText: String, filter: String?)  {
        worker.getRescipes(searchText: searchText, filter: filter) {[weak self] (fetchedRecipes) in
            guard let self = self else {return}
            guard let recipes = fetchedRecipes?.hits
            else {
                self.presenter.fetchedRecipesFailed()
                return }
            if recipes.count == 0 {
                self.presenter.fetchedRecipesFailed()
            }else {
                self.presenter.getFetchedRecipes(recipes: recipes)
            }
            
        }
    }
    //MARK:- save search
    func saveSearchText(_ searchText: String) {
        
        var historyArray = [String]()
        historyArray.append(searchText)
        
        if  var SavedHistoryArray = userDefault.stringArray(forKey: Constant.historyArray.rawValue) {
            if SavedHistoryArray.count == 10 {
                SavedHistoryArray.removeLast()
            }
            //remove repeated element
            if SavedHistoryArray.contains(where: {$0.compareWithCaseSensitive(searchText)}){
                SavedHistoryArray =  SavedHistoryArray.filter{!$0.compareWithCaseSensitive(searchText)}
            }
            
            historyArray.append(contentsOf: SavedHistoryArray)
        }
        userDefault.setValue(historyArray, forKey: Constant.historyArray.rawValue)
    }
    
}

