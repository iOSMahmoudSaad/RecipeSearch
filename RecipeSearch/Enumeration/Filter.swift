//
//  Filter.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation
enum Filter: String
{
    case ALL
    case LowSugar = "Low Sugar"
    case Keto
    case Vegan
    
    var healthFilter: String?
    {
        switch self {
        case .ALL:
            return nil
        case .LowSugar:
            return "low-sugar"
        case .Keto:
            return "keto-friendly"
        case .Vegan:
            return "vegan"
        }
    }
}
