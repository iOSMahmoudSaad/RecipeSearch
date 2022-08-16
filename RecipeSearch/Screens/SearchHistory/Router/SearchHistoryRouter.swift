//
//  SearchHistoryRouter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit
class SearchHistoryRouter: SearchHistoryRouterProtocol {
    func  createModule(delegate: SearchHistoryDelegate) -> UIViewController {
        let view: SearchHistoryTableViewController = .instantiate(storyboardName: "SearchHistoryStoryboard")
        let interactor = SearchHistoryInteractor()
        let presenter = SearchHistoryPresenter(view: view, interactor: interactor, router: self)
        presenter.searchHistoryDelegate = delegate
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}

