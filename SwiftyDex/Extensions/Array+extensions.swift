//
//  Array+extensions.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 19/06/2022.
//

import Foundation

extension Array {
    func binarySearch<T: Comparable>(by keyPath: KeyPath<Element, T>, is comparisonValue: T) -> Int? {
        let array = self
        var lowerBound = 0
        var upperBound = array.count - 1

        while lowerBound <= upperBound {
            let middle = lowerBound + (upperBound - lowerBound) / 2
            let value = array[middle][keyPath: keyPath]

            if value == comparisonValue {
                return middle
            }

            if value < comparisonValue {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }

        return nil
    }
}
