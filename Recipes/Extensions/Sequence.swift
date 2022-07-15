//
//  Sequence.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-13.
//

import Foundation
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
