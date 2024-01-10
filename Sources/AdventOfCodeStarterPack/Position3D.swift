//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 04.01.2024.
//

import Foundation

public struct Position3D: Hashable, Equatable {
    public var x, y, z: Int
}

public extension Position3D {
    static var zero = Position3D(0, 0, 0)
}

public extension Position3D {
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.init(x: x, y: y, z: z)
    }
}

extension Position3D: CustomStringConvertible  {
    
    public init?(_ str: String) {
        let v = str.split {!($0.isNumber || $0 == "-")}.compactMap{Int($0)}
        self.init(v)
    }
    
    public var description: String {
        "(\(x), \(y), \(z))"
    }
}

public extension Position3D {
    init(_ vec: (x: Int, y: Int, z: Int)) {
        self.init(x: vec.x, y: vec.y, z: vec.z)
    }
    
    var tuple: (x: Int, y: Int, z: Int) {
        get {
            (x, y, z)
        }
        set {
            x = newValue.x
            y = newValue.y
            z = newValue.z
        }
    }
}

public extension Position3D {
    init?(_ v: [Int]) {
        precondition(v.count == 3, "Vector must contain 3 elements")
        guard v.count == 3 else {return nil}
        x = v[0]
        y = v[1]
        z = v[2]
    }
    
    var vector: [Int] {
        get {
            [x, y, z]
        }
        set {
            x = newValue[0]
            y = newValue[1]
            z = newValue[2]
        }
    }
    
    subscript(_ position: Int) -> Int {
        precondition(position >= 0, "Index must be positive")
        precondition(position  < 3, "Index must be less 3")
        return switch position {
            case 0: x
            case 1: y
            case 2: z
            default: 0
        }
    }
}
