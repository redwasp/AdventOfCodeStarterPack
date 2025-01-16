import Foundation
public struct Position {
    public var x = 0
    public var y = 0
    
    public init() {
    }
    
    public init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    public init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
}

extension Position: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Position: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.x < rhs.x && lhs.y < rhs.y
    }
    
    public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.x > rhs.x && lhs.y > rhs.y
    }
    
    public static func >= (lhs: Self, rhs: Self) -> Bool {
        lhs.x >= rhs.x && lhs.y >= rhs.y
    }
    
    public static func <= (lhs: Self, rhs: Self) -> Bool {
        lhs.x <= rhs.x && lhs.y <= rhs.y
    }
}

public extension Position {
    
    init?(_ v: [Int]) {
        precondition(v.count == 2, "Vector must contain 2 elements")
        guard v.count == 2 else {return nil}
        x = v[0]
        y = v[1]
    }
    
    var vector: [Int] {
        get {
            [x, y]
        }
        set {
            x = newValue[0]
            y = newValue[1]
        }
    }
}

extension Position : Hashable {
}

extension Position : CustomStringConvertible  {
    
    public init?(_ str: String) {
        let v = str.split {!($0.isNumber || $0 == "-")}.compactMap{Int($0)}
        self.init(v)
    }
    
    public var description: String {
        "(\(x), \(y))"
    }
}

public extension Position {

    static func + (left: Position, right: Position) -> Position {
        Position(left.x + right.x, left.y + right.y)
    }
    
    static func + (left: Position, right: Int) -> Position {
        Position(left.x + right, left.y + right)
    }
    
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
    
    static func += (left: inout Position, right: Int) {
        left = left + right
    }
    
    static func - (left: Position, right: Position) -> Position {
        Position(left.x - right.x, left.y - right.y)
    }
    
    static func - (left: Position, right: Int) -> Position {
        Position(left.x - right, left.y - right)
    }
    
    static func -= (left: inout Position, right: Position) {
        left = left - right
    }
    
    static func -= (left: inout Position, right: Int) {
        left = left - right
    }
    
    static func * (position: Position, multiplier: Int) -> Position {
        return Position(position.x * multiplier, position.y * multiplier)
    }
    
    static func * (multiplier: Int, position: Position) -> Position {
        return Position(position.x * multiplier, position.y * multiplier)
    }
    
    static func *= (position: inout Position, multiplier: Int) {
        position = position * multiplier
    }

    static func / (position: Position, divider: Int) -> Position {
        Position(position.x / divider, position.y / divider)
    }
    
    static func /= (position: inout Position, divider: Int){
        position = position / divider
    }
    
    static func % (position: Position, divider: Int) -> Position {
        Position(position.x % divider, position.y % divider)
    }
    
    static func % (position: Position, divider: Position) -> Position {
        Position(position.x % divider.x, position.y % divider.y)
    }
    
    static func %= (position: inout Position, divider: Int){
        position = position % divider
    }
    
    static func %= (position: inout Position, divider: Position){
        position = position % divider
    }
    
    static func %% (position: Position, divider: Int) -> Position {
        return Position(position.x %% divider, position.y %% divider)
    }
    
    static func %% (position: Position, divider: Position) -> Position {
        return Position(position.x %% divider.x, position.y %% divider.y)
    }
    
    static func %%= (position: inout Position, divider: Int){
        position = position %% divider
    }
    
    static func %%= (position: inout Position, divider: Position){
        position = position %% divider
    }
}

public extension Position {
    static var zero = Position()
    static var one  = Position(1, 1)
}

public typealias Direction = Position

public extension Direction {
    init?(_ char: Character) {
        switch char {
        case "v", "D":
            self = .down
        case ">", "R":
            self = .right
        case "<", "L":
            self = .left
        case "^", "U":
            self = .up
        default:
            return nil
        }
    }
}

public extension Direction {
    static var up    = Direction(y: -1)
    static var down  = Direction(y: +1)
    static var left  = Direction(x: -1)
    static var right = Direction(x: +1)
    static var upLeft    = Direction(x: -1, y: -1)
    static var upRight   = Direction(x: +1, y: -1)
    static var downLeft  = Direction(x: -1, y: +1)
    static var downRight = Direction(x: +1, y: +1)
}

public extension Direction {
    static var north = Direction.up
    static var south = Direction.down
    static var west  = Direction.left
    static var east  = Direction.right
    static var northWest = Direction.upLeft
    static var northEast = Direction.upRight
    static var southWest = Direction.downLeft
    static var southEast = Direction.downRight
}

public typealias Directions = [Direction]

public extension Directions {
    static var clockwise:        Directions =  [.up, .right, .down, .left ]
    static var counterClockwise: Directions =  [.up, .left,  .down, .right]
    static var clockwiseIncludeDiagonals:        Directions = [.up, .upRight, .right, .downRight, .down, .downLeft,  .left,  .upLeft]
    static var counterClockwiseIncludeDiagonals: Directions = [.up, .upLeft , .left,  .downLeft,  .down, .downRight, .right, .upRight]
    
    static var downRight: Directions = [.down, .right, .left,  .up]
    static var    upLeft: Directions = [.up,   .left,  .right, .down]
    static var  downLeft: Directions = [.down, .left,  .right, .up]
    static var   upRight: Directions = [.up,   .right, .left,  .down]
}

public extension Direction {
    var index: Int {
        switch self {
        case .up:    0
        case .down:  1
        case .left:  2
        case .right: 3
        case .upLeft: 4
        case .upRight: 5
        case .downLeft: 6
        case .downRight: 7
        default: -1
        }
    }
}



public extension Position {
    var up:        Position {self + .up}
    var down:      Position {self + .down}
    var left:      Position {self + .left}
    var right:     Position {self + .right}
    var upLeft:    Position {self + .upLeft}
    var upRight:   Position {self + .upRight}
    var downLeft:  Position {self + .downLeft}
    var downRight: Position {self + .downRight}
    
    func up(_ factor: Int = 1)    -> Position {self + .up    * factor}
    func down(_ factor: Int = 1)  -> Position {self + .down  * factor}
    func left(_ factor: Int = 1)  -> Position {self + .left  * factor}
    func right(_ factor: Int = 1) -> Position {self + .right * factor}
    
    func offset(_ x: Int, _ y: Int, factor: Int = 1) -> Position {self + Position(x, y) * factor}
    func offset(x: Int = 0, y: Int = 0, factor: Int = 1) -> Position {self + Position(x, y) * factor}
}

public extension Position {
    mutating func moveUp(_ factor: Int = 1) {
        move(.up, factor: factor)
    }
    
    mutating func moveDown(_ factor: Int = 1) {
        move(.down, factor: factor)
    }
    
    mutating func moveLeft(_ factor: Int = 1) {
        move(.left, factor: factor)
    }
    
    mutating func moveRight(_ factor: Int = 1) {
        move(.right, factor: factor)
    }
    
    mutating func move(_ direction: Position, factor: Int = 1) {
        self += direction * factor
    }
}

public extension Position {
    mutating func rotateRight() {
        (x, y) = (-y, x)
    }
    
    mutating func rotateLeft() {
        (x, y) = (y, -x)
    }
    
    mutating func reverse() {
        (x, y) = (-x, -y)
    }
    
    func rotatedRight() -> Position {
        Position(-y, x)
    }
    
    func rotatedLeft() -> Position {
        Position(y, -x)
    }
    
    func reversed() -> Position {
        Position(-x, -y)
    }
}

public extension Position {
    func distance(to position: Position) -> Int {
        return abs(self.x - position.x) + abs(self.y - position.y)
    }
}

public extension Position {
    var direction: Position {
        Position(x == 0 ? 0 : (x > 0 ? 1 : -1),
                 y == 0 ? 0 : (y > 0 ? 1 : -1))
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public extension SortComparator where Self == Position.Comparator {
    static var YX: Position.Comparator { Position.YX }
}

@available(macOS 12.0, *)
public extension Position {
    static var YX = Comparator()
    struct Comparator: SortComparator {
        public typealias Compared = Position
        public var order: SortOrder = .forward
        public func compare(_ lhs: Position, _ rhs: Position) -> ComparisonResult {
            let result: ComparisonResult =
            if lhs.y == rhs.y {
                if lhs.x == rhs.x {
                    .orderedSame
                } else {
                    lhs.x < rhs.x ? .orderedAscending : .orderedDescending
                }
            } else {
                lhs.y < rhs.y ? .orderedAscending : .orderedDescending
            }
            return order == .forward ? result : result.reversed
        }
    }
}

extension ComparisonResult {
  var reversed: ComparisonResult {
    switch self {
    case .orderedAscending: return .orderedDescending
    case .orderedSame: return .orderedSame
    case .orderedDescending: return .orderedAscending
    }
  }
}
