//
//  SearchHistoryInteractor.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
class SearchHistoryInteractor: SearchHistoryInputProtocol {
    
    var presenter: SearchHistoryOutputProtocol!
    private var userDefaults: UserDefaults
    init() {
        userDefaults = UserDefaults.standard
    }
    
    func getSearchHistory() {
        guard let savedSearchHistory = userDefaults.stringArray(forKey: Constant.historyArray.rawValue)
        else {
            presenter.getSearchHistoryArray(nil)
            return
        }
        presenter.getSearchHistoryArray(savedSearchHistory)
    }
    
}
