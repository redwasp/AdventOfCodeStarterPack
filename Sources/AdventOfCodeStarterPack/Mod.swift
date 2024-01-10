//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 11.02.2023.
//

import Foundation

infix operator %%=
infix operator %%

public
extension Int {
    static func %% (_ left: Int, _ right: Int) -> Int {
       let mod = left % right
       return mod >= 0 ? mod : mod + right
    }
    
    static func %%= (_ left: inout Int, _ right: Int) {
        left = left %% right
    }
}
