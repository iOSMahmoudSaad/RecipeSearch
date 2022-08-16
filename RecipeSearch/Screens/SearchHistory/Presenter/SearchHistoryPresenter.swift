//
//  SearchHistoryPresenter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
class SearchHistoryPresenter: SearchHistoryPresenterProtocol {
    
    //MARK: - variables
    private weak var view: SearchHistoryTableViewController?
    private var interactor: SearchHistoryInteractor
    private var router: SearchHistoryRouter
    private var searchHistoryArray: [String]
    var searchHistoryDelegate: SearchHistoryDelegate?
    var numberOfHistory: Int {
        return searchHistoryArray.count
    }
    //MARK: - init
    init( view: SearchHistoryTableViewController, interactor: SearchHistoryInteractor ,router: SearchHistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.searchHistoryArray = []
    }
    
    //MARK: - loading search history
    func getSearchHistory(){
        interactor.getSearchHistory()
    }
    
    //MARK: - search from history
    func selectedHistoryRow(at indexPath: IndexPath) {
        guard let searchHistoryDelegate = searchHistoryDelegate
        else {return}
        searchHistoryDelegate.searchFromHistory(with: searchHistoryArray[indexPath.row])
    }
    //MARK: - cell configuration
    func configureSearchHistoryCell(cell: SearchHistoryTableViewCellProtocol, indexPath: IndexPath) {
        cell.configure(searchHistoryText: searchHistoryArray[indexPath.row])
        
    }
    
}


//MARK: - SearchHistoryOutputProtocol
extension SearchHistoryPresenter: SearchHistoryOutputProtocol {
    func getSearchHistoryArray(_ searchHistoryArray: [String]?) {
        guard let historyArray = searchHistoryArray,
              let view = view
        else {
            return
        }
        self.searchHistoryArray = historyArray
        view.reloadData()
    }
    
    
}
