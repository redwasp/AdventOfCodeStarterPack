//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 10.01.2024.
//

import Foundation

public struct Rect {
    let min: Position
    let max: Position
    public init(_ p1: Position, _ p2: Position) {
        self.min = Position(Swift.min(p1.x, p2.x), Swift.min(p1.y, p2.y))
        self.max = Position(Swift.max(p1.x, p2.x), Swift.max(p1.y, p2.y))
    }
    
    public func contains(_ position: Position) -> Bool {
        return position >= self.min &&  position <= self.max
    }
}
