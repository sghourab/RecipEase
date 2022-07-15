//
//  Color.swift
//  Recipes
//
//  Created by Summer Crow on 2022-05-30.
//

import Foundation
import SwiftUI


extension Color {
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
}
