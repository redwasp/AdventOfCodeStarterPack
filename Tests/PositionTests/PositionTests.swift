import XCTest
@testable import Position

final class PositionTests: XCTestCase {
    
    func testZerro() throws {
        let p = Position()
        XCTAssertEqual(p.x, 0)
        XCTAssertEqual(p.y, 0)
    }
    
    func testNormal() throws {
        let p = Position(1, 2)
        XCTAssertEqual(p.x, 1)
        XCTAssertEqual(p.y, 2)
    }
    
    func testVactor() throws {
        let p = Position([1, 2])
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 1)
        XCTAssertEqual(p!.y, 2)
    }
    
    func testString() throws {
        let p = Position("(1, 2)")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 1)
        XCTAssertEqual(p!.y, 2)
    }
    
    func testString2() throws {
        let p = Position("123 345")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 123)
        XCTAssertEqual(p!.y, 345)
    }
    
    func testString3() throws {
        let p = Position("x:123y:345")
        XCTAssertNotNil(p)
        XCTAssertEqual(p!.x, 123)
        XCTAssertEqual(p!.y, 345)
    }
    
    func testField1() throws {
        var a  = [[0, 1], [2, 3]]
        let p00 = Position(0,0)
        let p01 = Position(0,1)
        let p10 = Position(1,0)
        let p11 = Position(1,1)
        XCTAssertEqual(a[p00], 0)
        XCTAssertEqual(a[p10], 1)
        XCTAssertEqual(a[p01], 2)
        XCTAssertEqual(a[p11], 3)
        a[p00] = 4
        a[p01] = 5
        a[p10] = 6
        a[p11] = 7
        XCTAssertEqual(a[p00], 4)
        XCTAssertEqual(a[p01], 5)
        XCTAssertEqual(a[p10], 6)
        XCTAssertEqual(a[p11], 7)
    }
    
    func testField2() throws {
        var a  = [["a", "b"], ["c", "d"]]
        let p00 = Position(0, 0)
        let p01 = Position(0, 1)
        let p10 = Position(1, 0)
        let p11 = Position(1, 1)
        XCTAssertEqual(a[p00], "a")
        XCTAssertEqual(a[p10], "b")
        XCTAssertEqual(a[p01], "c")
        XCTAssertEqual(a[p11], "d")
        a[p00] = "e"
        a[p01] = "f"
        a[p10] = "g"
        a[p11] = "h"
        XCTAssertEqual(a[p00], "e")
        XCTAssertEqual(a[p01], "f")
        XCTAssertEqual(a[p10], "g")
        XCTAssertEqual(a[p11], "h")
    }
    
//    func testField3() throws {
//        var a  = [0: [0: "a", 1: "b"], 1: [0: "c", 1: "d"]]
//        let p00 = Position(0, 0)
//        let p01 = Position(0, 1)
//        let p10 = Position(1, 0)
//        let p11 = Position(1, 1)
//        XCTAssertEqual(a[p00], "a")
//        XCTAssertEqual(a[p10], "b")
//        XCTAssertEqual(a[p01], "c")
//        XCTAssertEqual(a[p11], "d")
//    }
}
