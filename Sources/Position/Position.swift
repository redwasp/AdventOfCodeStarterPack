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
        if lhs.y == rhs.y {
            return lhs.x < rhs.x
        } else {
            return lhs.y < rhs.y
        }
    }
}

public extension Position {
    init?(_ v: [Int]) {
        guard v.count == 2 else {return nil}
        self.x = v[0]
        self.y = v[1]
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
        let v = str.split {!$0.isNumber}.compactMap{Int($0)}
        self.init(v)
    }
    public var description: String {
        "(\(x), \(y))"
    }
}

public extension Position {

    static func + (left: Position, right: Position) -> Position {
        return Position(left.x + right.x, left.y + right.y)
    }
    
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
    
    static func - (left: Position, right: Position) -> Position {
        return Position(left.x - right.x, left.y - right.y)
    }
    
    static func -= (left: inout Position, right: Position) {
        left = left - right
    }
    
    static func * (position: Position, multiplier: Int) -> Position {
        return Position(position.x * multiplier, position.y * multiplier)
    }
    
    static func * (multiplier: Int, position: Position) -> Position {
        return Position(position.x * multiplier, position.y * multiplier)
    }
    
    static func *= (position: inout Position, multiplier: Int){
        position = position * multiplier
    }
    
    static func / (position: Position, divider: Int) -> Position {
        return Position(position.x / divider, position.y / divider)
    }
    
    static func /= (position: inout Position, divider: Int){
        position = position / divider
    }
    
    static func % (position: Position, divider: Int) -> Position {
        return Position(position.x % divider, position.y % divider)
    }
    
    static func %= (position: inout Position, divider: Int){
        position = position % divider
    }
    
    static func %% (position: Position, divider: Int) -> Position {
        return Position(position.x %% divider, position.y %% divider)
    }
    
    static func %%= (position: inout Position, divider: Int){
        position = position %% divider
    }
}

public extension Position {
    static var zero = Position()
}

public extension Position {
    static var up    = Position(y:-1)
    static var down  = Position(y:+1)
    static var left  = Position(x:-1)
    static var right = Position(x:+1)
    static var upLeft    = Position(x:-1, y:-1)
    static var upRight   = Position(x:+1, y:-1)
    static var downLeft  = Position(x:-1, y:+1)
    static var downRight = Position(x:+1, y:+1)
    
    static func directions(clockwise: Bool = true, diagonal: Bool = false) -> [Position] {
        switch (clockwise, diagonal) {
        case (true, false):
            return [.up, .right, .down, .left]
        case (false, false):
            return [.up, .left, .down, .right]
        case (true, true):
            return [.up, .upRight, .right, .downRight, .down, .downLeft, .left, .upLeft]
        case (false, true):
            return [.up, .upLeft , .left, .downLeft, .down, .downRight, .right, .upRight]
        }
    }
}

public extension Position {
    static var north = Position.up
    static var south = Position.down
    static var west  = Position.left
    static var east  = Position.right
    static var northWest = Position.upLeft
    static var northEast = Position.upRight
    static var southWest = Position.downLeft
    static var southEast = Position.downRight
}

public extension Position {
    func up(_ offset: Int = 1)    -> Position {self + .up    * offset}
    func down(_ offset: Int = 1)  -> Position {self + .down  * offset}
    func left(_ offset: Int = 1)  -> Position {self + .left  * offset}
    func right(_ offset: Int = 1) -> Position {self + .right * offset}
}

public extension Position {
    mutating func moveUp(_ offset: Int = 1) {
        move(.up, offset: offset)
    }
    
    mutating func moveDown(_ offset: Int = 1) {
        move(.down, offset: offset)
    }
    
    mutating func moveLeft(_ offset: Int = 1) {
        move(.left, offset: offset)
    }
    
    mutating func moveRight(_ offset: Int = 1) {
        move(.right, offset: offset)
    }
    
    mutating func move(_ direction: Position, offset: Int) {
        self += direction * offset
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
