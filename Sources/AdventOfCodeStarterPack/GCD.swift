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

func trialDivision(_ number: Int) -> [Int] {
    var remainder = number
    var dividers: [Int] = []
    while remainder % 2 == 0 {
        dividers.append(2)
        remainder /= 2
    }
    while remainder % 3 == 0 {
        dividers.append(3)
        remainder /= 3
    }
    var divisor = 5
    var right = 9
    var offset = 16
    repeat {
        right += offset
        if right > remainder {
            break
        }
        if remainder % divisor == 0 {
            dividers.append(divisor)
            remainder /= divisor
            right -= offset
        } else {
            divisor += 2
            offset += 8
        }
    } while true
    if (remainder != 1) {
        dividers.append(remainder)
    }
    return dividers
}

func trialDivisionSet(_ number: Int) -> Set<Int> {
    var remainder = number
    var dividers: Set<Int> = []
    while remainder % 2 == 0 {
        dividers.insert(2)
        remainder /= 2
    }
    while remainder % 3 == 0 {
        dividers.insert(3)
        remainder /= 3
    }
    var divisor = 5
    var right = 9
    var offset = 16
    repeat {
        right += offset
        if right > remainder {
            break
        }
        if remainder % divisor == 0 {
            dividers.insert(divisor)
            remainder /= divisor
            right -= offset
        } else {
            divisor += 2
            offset += 8
        }
    } while true
    if (remainder != 1) {
        dividers.insert(remainder)
    }
    return dividers
}

func trialDivisionSortedSet(_ number: Int) -> [Int] {
    var remainder = number
    var dividers: [Int] = []
    
    if remainder % 2 == 0 {
        remainder /= 2
        dividers.append(2)
        while remainder % 2 == 0 {
            remainder /= 2
        }
    }

    if remainder % 3 == 0 {
        remainder /= 3
        dividers.append(3)
        while remainder % 3 == 0 {
            remainder /= 3
        }
    }
    
    var divisor = 5
    var right = 9
    var offset = 16
    repeat {
        right += offset
        if right > remainder {
            break
        }
        if remainder % divisor == 0 {
            if dividers.last != divisor {
                dividers.append(divisor)
            }
            remainder /= divisor
            right -= offset
        } else {
            divisor += 2
            offset += 8
        }
    } while true
    if (remainder != 1) {
        if dividers.last != remainder {
            dividers.append(remainder)
        }
    }
    return dividers
}


