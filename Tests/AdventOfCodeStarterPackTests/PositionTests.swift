import XCTest
@testable import AdventOfCodeStarterPack

final class PositionTests: XCTestCase {
    
    func testInitZerro() throws {
        let p = Position()
        XCTAssertEqual(p, Position(0, 0))
        XCTAssertEqual(p, Position(x:0, y:0))
        XCTAssertEqual(p, Position([0, 0]))
        XCTAssertEqual(p, .zero)
    }
    
    func testInitNormal() throws {
        let p = Position(1, 2)
        XCTAssertEqual(p.x, 1)
        XCTAssertEqual(p.y, 2)
    }
    
    func testInitVector() throws {
        let p = Position([1, 2])
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 1)
        XCTAssertEqual(p!.y, 2)
    }
    
    func testInitString() throws {
        let p = Position("(1, 2)")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 1)
        XCTAssertEqual(p!.y, 2)
    }
    
    func testInitString2() throws {
        let p = Position("123 345")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 123)
        XCTAssertEqual(p!.y, 345)
    }
    
    func testInitString3() throws {
        let p = Position("x:123y:345")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 123)
        XCTAssertEqual(p!.y, 345)
    }
    
    func testAdd() throws {
        XCTAssertEqual(Position( 1,  1) + Position( 1,  1), Position( 2,  2))
        XCTAssertEqual(Position( 1,  1) + Position(-1, -1), Position( 0,  0))
        XCTAssertEqual(Position( 1,  2) + Position( 5,  6), Position( 6,  8))
        XCTAssertEqual(Position( 1,  2) + Position( 0,  0), Position( 1,  2))
        XCTAssertEqual(Position( 0,  0) + Position( 1,  2), Position( 1,  2))
        XCTAssertEqual(Position(-2,  3) + Position( 1, -5), Position(-1, -2))
    }
    
    func testAdd2() throws {
        var a = Position(100,  100)
        var b = Position(3  , -1  )
        a += b
        XCTAssertEqual(a, Position(103,  99))
        b += a
        XCTAssertEqual(b, Position(106,  98))
        a += .zero
        XCTAssertEqual(a, Position(103,  99))
        a += b + b
        XCTAssertEqual(a, Position(315,  295))
    }
    
    func testRotate() throws {
        var a = Position.up
        a.rotateRight()
        XCTAssertEqual(a, .right)
        a.rotateRight()
        XCTAssertEqual(a, .down)
        a.rotateRight()
        XCTAssertEqual(a, .left)
        a.rotateRight()
        XCTAssertEqual(a, .up)
        
        a.rotateLeft()
        XCTAssertEqual(a, .left)
        a.rotateLeft()
        XCTAssertEqual(a, .down)
        a.rotateLeft()
        XCTAssertEqual(a, .right)
        a.rotateLeft()
        XCTAssertEqual(a, .up)
        
        a.reverse()
        XCTAssertEqual(a, .down)
        a.rotateRight()
        a.reverse()
        XCTAssertEqual(a, .right)
    }
    
    func testRotated() throws {
        var a = Position.up
        a = a.rotatedRight()
        XCTAssertEqual(a, .right)
        a = a.rotatedLeft()
        XCTAssertEqual(a, .up)
        a.reverse()
        XCTAssertEqual(a, .down)
    }

}
