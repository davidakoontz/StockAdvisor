//
//  Array+Extensions.swift
//  StockAdvisor
//
//  Created by David on 4/1/22.
//

import Foundation

extension Array where Element: Hashable {
    
    func difference(from other: [Element]) -> [Element] {
        let thisSet  = Set(self)
        let otherSet =  Set(other)
        
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
