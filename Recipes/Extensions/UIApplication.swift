//
//  UIApplication.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-15.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
