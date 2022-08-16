//
//  String.swift
//  RecipeSearch
//
//  Created by Mahmoud Saad on 16/08/2022.
//

import Foundation

extension String
{
    func removeEmptySpace()-> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    func compareWithCaseSensitive(_ anotherSrting: String) -> Bool {
        return self.caseInsensitiveCompare(anotherSrting) == .orderedSame
    }
}
