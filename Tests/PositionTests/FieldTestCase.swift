//
//  Field.swift
//  
//
//  Created by Pavlo Liashenko on 11.12.2023.
//

import XCTest
@testable import Position

final class FieldTestCase: XCTestCase {

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
    
    func testFieldSafe() throws {
        let a  = [[0, 1], [2, 3]]
        
        XCTAssertEqual(a[Position(0,0)], 0)
        XCTAssertEqual(a[Position(1,0)], 1)
        XCTAssertEqual(a[Position(0,1)], 2)
        XCTAssertEqual(a[Position(1,1)], 3)
        
        XCTAssertNil(a[safe:Position(0, 3)])
        XCTAssertNil(a[safe:Position(3, 0)])
        XCTAssertNil(a[safe:Position(3, 3)])
        XCTAssertNil(a[safe:Position(0, -1)])
        XCTAssertNil(a[safe:Position(-1, 0)])
        XCTAssertNil(a[safe:Position(-1, -1)])
    }

    func testFieldMod() throws {
        let a  = [[0, 1], [2, 3]]
        
        XCTAssertEqual(a[Position(0,0)], 0)
        XCTAssertEqual(a[Position(1,0)], 1)
        XCTAssertEqual(a[Position(0,1)], 2)
        XCTAssertEqual(a[Position(1,1)], 3)
        
        XCTAssertEqual(a[mod:Position(0, 3)], 2)
        XCTAssertEqual(a[mod:Position(3, 0)], 1)
        XCTAssertEqual(a[mod:Position(3, 3)], 3)
        XCTAssertEqual(a[mod:Position(0, -1)], 2)
        XCTAssertEqual(a[mod:Position(-1, 0)], 1)
        XCTAssertEqual(a[mod:Position(-1, -1)], 3)
    }

}
