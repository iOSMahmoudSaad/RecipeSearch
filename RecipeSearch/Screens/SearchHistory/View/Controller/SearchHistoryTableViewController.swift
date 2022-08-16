//
//  SearchHistoryTableViewController.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit

class SearchHistoryTableViewController: UITableViewController {
    
    
    // MARK: - variables
    
    var presenter: SearchHistoryPresenter!
    private var searchHistoryCell: String!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellRegisteration()
        
    }
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        presenter.getSearchHistory()
    }
    
    // MARK: - cellRegisteration
    func cellRegisteration() {
        searchHistoryCell = String(describing: SearchHistoryTableViewCell.self)
        self.tableView.register(UINib(nibName: searchHistoryCell, bundle: nil), forCellReuseIdentifier: searchHistoryCell)
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfHistory
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: searchHistoryCell, for: indexPath) as? SearchHistoryTableViewCell
        else {
            return UITableViewCell()
            
        }
        presenter.configureSearchHistoryCell(cell: cell, indexPath: indexPath)
        return cell
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedHistoryRow(at: indexPath )
        self.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
// MARK: - SearchHistoryViewProtocol
extension SearchHistoryTableViewController: SearchHistoryViewProtocol {
    func reloadData() {
        self.tableView.reloadData()
    }
}


