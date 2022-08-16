//
//  Recipe.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation

struct RecipeData: Codable {
    let label: String
    let image: String
    let source: String
    let url: String
    let healthLabels: [String]
    let ingredientLines: [String]
}
struct Recipe: Codable {
    let recipe: RecipeData
}
struct RecipeModel: Codable {
    let hits: [Recipe]
}
