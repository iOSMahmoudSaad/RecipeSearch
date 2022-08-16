//
//  Alert.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
import UIKit

extension UIViewController
{
    func showAlert(with message: String)
    {
        let alert = UIAlertController(title: "Attention !", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.6889460357, blue: 0, alpha: 1)
        self.present(alert, animated: true, completion: nil)
    }
    static func instantiate<T>(storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewControllerIdentifier = String(describing: T.self)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
        return viewController
    }
}
