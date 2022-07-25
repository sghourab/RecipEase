//
//  LikedRecipe.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-25.
//

import Foundation
import SwiftUI

struct LikedRecipeModel: Identifiable {
    var name: String
    var id: Int
    var image: UIImage
    var tags: [String]
}
