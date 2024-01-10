//
//  Position3DTestCase.swift
//  
//
//  Created by Pavlo Liashenko on 04.01.2024.
//

import XCTest
import AdventOfCodeStarterPack

final class Position3DTestCase: XCTestCase {

    func testInitString() throws {
        let p = Position3D("12 23 34")
        let p1 = Position3D("12, 23, 34")
        let p2 = Position3D("(12, 23, 34)")
        let p3 = Position3D("X:12, Y:23, Z:34")
        let p4 = Position3D("X: 12, Y: 23, Z: 34")
        let p5 = Position3D("X: 12 Y: 23 Z: 34")

        let t = Position3D(12, 23, 34)

        XCTAssertEqual(p, t)
        XCTAssertEqual(p1, t)
        XCTAssertEqual(p2, t)
        XCTAssertEqual(p3, t)
        XCTAssertEqual(p4, t)
        XCTAssertEqual(p5, t)
    }

    func testNegativeInitString() throws {
        let p = Position3D("-12 23 -34")
        let p1 = Position3D("-12, 23, -34")
        let p2 = Position3D("(-12, 23, -34)")
        let p3 = Position3D("X:-12, Y:23, Z:-34")
        let p4 = Position3D("X: -12, Y: 23, Z: -34")
        let p5 = Position3D("x: -12 Y: 23 z: -34")

        let t = Position3D(-12, 23, -34)

        XCTAssertEqual(p, t)
        XCTAssertEqual(p1, t)
        XCTAssertEqual(p2, t)
        XCTAssertEqual(p3, t)
        XCTAssertEqual(p4, t)
        XCTAssertEqual(p5, t)
    }

}
