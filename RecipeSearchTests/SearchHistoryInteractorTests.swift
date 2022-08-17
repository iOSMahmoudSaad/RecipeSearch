//
//  SearchHistoryInteractorTests.swift
//  RecipeSearchTests
//
//  Created by Mahmoud Saad on 17/08/2022.
//

import XCTest
@testable import RecipeSearch
class SearchHistoryInteractorTests: XCTestCase {
    
    var interactor: SearchHistoryInteractor!
    var presenter: SearchHistoryPresenter!
    var router: SearchHistoryRouter!
    
    
    
    override func setUpWithError() throws {
        let view: SearchHistoryTableViewController = .instantiate(storyboardName: Constant.SearchHistoryStoryboard.rawValue)
        interactor = SearchHistoryInteractor()
        router = SearchHistoryRouter()
        presenter = SearchHistoryPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
    }
    
    
    override func tearDownWithError() throws {
        interactor = nil
        router = nil
        presenter = nil
    }
    
    func testSavedSearchHistory() throws {
        let recipeSearchInteractor = RecipeSearchInteractor()
        recipeSearchInteractor.saveSearchText("meat")
        interactor.getSearchHistory()
        XCTAssertGreaterThan(presenter.numberOfHistory, 0)
        XCTAssertNotEqual(presenter.numberOfHistory, 0)
    }
    
    
    
}

