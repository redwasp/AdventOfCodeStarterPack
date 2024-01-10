//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 04.01.2024.
//

import Foundation

public func gaussianElimination(_ matrix: [[Int]], _ results: [Int]) -> [Int] {
    gaussianElimination(matrix.map{$0.map{Decimal($0)}}, results.map{Decimal($0)}).map{
        var result = Decimal.nan
        var number = $0
        NSDecimalRound(&result, &number, 0, .plain)
        return NSDecimalNumber(decimal: result).intValue
    }
}

public func gaussianElimination(_ matrix: [[Decimal]], _ results: [Decimal]) -> [Decimal] {
    var matrix = matrix
    var results = results
    let length = matrix.count
    for row in 0..<length {
        let pivot = matrix[row][row]
        for col in 0..<length {
            matrix[row][col] /= pivot;
        }
        results[row] /= pivot
        
        for row1 in 0..<length {
            if row1 != row {
                let factor = matrix[row1][row]
                for col in 0..<length {
                    matrix[row1][col] -= factor * matrix[row][col]
                }
                results[row1] -= factor * results[row]
            }
        }
    }
    return results
}
