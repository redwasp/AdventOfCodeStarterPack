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
            return self[position.y][position.x]
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
    
    subscript(mod position: Position) -> Self.Element.Element {
        precondition(self.count > 0, "Empty Collection")
        let y = position.y %% self.count
        let line = self[y]
        let x = position.x %% line.count
        return line[x]
    }
    
    var size: Position {
        guard self.count > 0 else {return .zero}
        return Position(self[0].count, self.count)
    }
    
    var maxSize: Position {
        guard self.count > 0 else {return .zero}
        return Position(self.map{$0.count}.max()!, self.count)
    }
}


