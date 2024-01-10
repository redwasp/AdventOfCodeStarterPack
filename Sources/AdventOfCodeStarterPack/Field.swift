//
//  File.swift
//  
//
//  Created by Pavlo Liashenko on 29.01.2023.
//

import Foundation

public extension MutableCollection where Self.Element: MutableCollection, Self.Index == Int, Self.Element.Index == Int {
    
    subscript(_ position: Position) -> Self.Element.Element {
        get {
            self[position.y][position.x]
        }
        set {
            self[position.y][position.x] = newValue
        }
    }
    
    subscript(safe position: Position) -> Self.Element.Element? {
        get {
            guard position.y < self.count && position.y >= 0 else {return nil}
            let line = self[position.y]
            guard position.x < line.count && position.x >= 0 else {return nil}
            return line[position.x]
        }
    }
    
    subscript(_ position: Position, default defaultValue: Self.Element.Element) -> Self.Element.Element {
        get {
            guard position.y < self.count && position.y >= 0 else {return defaultValue}
            let line = self[position.y]
            guard position.x < line.count && position.x >= 0 else {return defaultValue}
            return line[position.x]
        }
    }
    
    subscript(mod position: Position) -> Self.Element.Element {
        precondition(self.count > 0, "Empty Collection")
        let y = position.y %% self.count
        let line = self[y]
        let x = position.x %% line.count
        return line[x]
    }
    
    typealias Size = Position
    
    var size: Size {
        guard self.count > 0 else {return .zero}
        return Position(self[0].count, self.count)
    }
    
    var maxSize: Size {
        guard self.count > 0 else {return .zero}
        return Position(self.map{$0.count}.max()!, self.count)
    }
    
    func transform<T>(_ transform: (Position, Self.Element.Element) throws -> T) rethrows -> [[T]] {
        var grid : [[T]] = []
        for y in 0..<self.count {
            for x in 0..<self[y].count {
                let position = Position(x, y)
                grid[position] = try transform(position, self[position])
            }
        }
        return grid
    }
    
    var columns: [[Self.Element.Element]] {
        var columns: [[Self.Element.Element]] = []
        let size = self.size
        for x in 0..<size.x {
            columns.append([])
            for y in 0..<size.y {
                columns[x].append(self[y][x])
            }
        }
        return columns
    }
    
    var rotated: [[Self.Element.Element]] {
        self.columns
    }
    
    func valid(position: Position) -> Bool {
        guard position.y < self.count && position.y >= 0 else {return false}
        let line = self[position.y]
        guard position.x < line.count && position.x >= 0 else {return false}
        return true
    }
    
    var lastPosition: Position {
        let y = self.count - 1
        let x = self[y].count - 1
        return Position(x, y)
    }
}


