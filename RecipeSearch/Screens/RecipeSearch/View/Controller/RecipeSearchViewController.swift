//
//  RecipeSearchViewController.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit

class RecipeSearchViewController: UIViewController {

    @IBOutlet weak var FilterCollectionView: UICollectionView!
    
    @IBOutlet weak var recipesTableView: UITableView!
  
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var noSearchView: UIStackView!
    var presenter: RecipeSearchPresenterProtocol!
    var searchController: UISearchController!
    var filterCollectionViewCell: String!
    var recipeTableViewCell: String!
    var searchControllerText: String!
    var currentSelectedFilter = 0 {
        didSet {
            self.FilterCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellsRegisteration()
        self.searchControllerConfiguration()
        self.visibilityOfUIElement()
       
    }
    
    func visibilityOfUIElement()
    {
        self.loadingIndicator.stopAnimating()
        self.noSearchView.isHidden = false
        self.FilterCollectionView.isHidden = true
        self.recipesTableView.isHidden = true
    }
    func cellsRegisteration() {
        
        filterCollectionViewCell = String(describing: FilterCell.self)
        recipeTableViewCell = String(describing: RecipeCell.self)
        
        FilterCollectionView.register(UINib(nibName: filterCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: filterCollectionViewCell)
        recipesTableView.register(UINib(nibName: recipeTableViewCell, bundle: nil), forCellReuseIdentifier: recipeTableViewCell)
    }
    func searchControllerConfiguration() {
      self.navigationItem.title = "Recipes Search"
        
        searchController.searchBar.placeholder = "Search For Recipe"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0.6841227412, green: 0.3237389922, blue: 0.8700659871, alpha: 1)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
    }
    
}
extension RecipeSearchViewController: RecipeSearchViewProtocol
{
    var searchHistoryText: String {
        
        get {
            return searchControllerText
        }
        set {
            searchControllerText = newValue
        }
    }
    func showLoadingIndicator() {
        self.loadingIndicator.startAnimating()
        self.noSearchView.isHidden = true
    }
    
    func hideLoadingIndicator() {
        self.loadingIndicator.stopAnimating()
        self.FilterCollectionView.isHidden = false
        self.recipesTableView.isHidden = false
    }
    func failedData() {
        self.loadingIndicator.stopAnimating()
        self.noSearchView.isHidden = false
        self.FilterCollectionView.isHidden = true
        self.recipesTableView.isHidden = true
        self.searchController.searchBar.text = nil
    }
    func reloadData() {
        self.recipesTableView.reloadData()
    }
}
extension RecipeSearchViewController: SearchHistoryDelegate
{
    func searchFromHistory(with selectedSearchHistory: String) {
        self.searchHistoryText = selectedSearchHistory
        self.searchController.searchBar.text = selectedSearchHistory
        self.presenter.getRecipes(searchText: selectedSearchHistory, filter: nil)
    }
    
    
}
