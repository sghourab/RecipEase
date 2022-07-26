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
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
}


struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
