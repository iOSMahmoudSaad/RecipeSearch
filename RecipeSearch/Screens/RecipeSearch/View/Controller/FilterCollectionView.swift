//
//  FilterCollectionView.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import UIKit
//MARK:- UICollectionViewDataSource
extension RecipeSearchViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfFilters
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCollectionViewCell, for: indexPath) as? FilterCell
        
        else {
            return UICollectionViewCell()
        }

        filterCell.contentView.backgroundColor =  currentSelectedFilter == indexPath.row ? .lightGray : nil
        presenter.configureFilterCell(cell: filterCell,indexPath: indexPath)
        return filterCell
    }
}
//MARK:- UICollectionViewDelegate
extension RecipeSearchViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        currentSelectedFilter = indexPath.row
        let filter =  presenter.getFilterName(at: indexPath)
        presenter.getRecipes(searchText: searchControllerText, filter: filter)
    }
}
//MARK:- UICollectionViewDelegateFlowLayout
extension RecipeSearchViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
}

