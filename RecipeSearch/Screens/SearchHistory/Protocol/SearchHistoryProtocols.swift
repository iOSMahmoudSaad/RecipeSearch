//
//  SearchHistoryProtocols.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit
protocol SearchHistoryViewProtocol: AnyObject {
    func reloadData()
}
protocol SearchHistoryProtocol {
    func getSearchHistory()
}
protocol SearchHistoryPresenterProtocol: SearchHistoryProtocol {
    var numberOfHistory: Int {get}
    func getSearchHistory()
    func configureSearchHistoryCell(cell: SearchHistoryTableViewCellProtocol, indexPath: IndexPath)
    func selectedHistoryRow(at indexPath: IndexPath)
}
protocol SearchHistoryRouterProtocol {
    func  createModule(delegate: SearchHistoryDelegate)-> UIViewController
}
protocol SearchHistoryInputProtocol: SearchHistoryProtocol {
    
}
protocol SearchHistoryOutputProtocol {
    func getSearchHistoryArray(_ searchHistoryArray: [String]?)
}
protocol SearchHistoryTableViewCellProtocol {
    func configure(searchHistoryText: String)
}


