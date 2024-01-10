//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 04.01.2024.
//

import Foundation

public func gcd(_ a: Int, _ b: Int) -> Int {
    b == 0 ? a : gcd(b, a % b)
}

public func lcm(_ m: Int, _ n: Int) -> Int {
    m*n / gcd(m, n)
}
