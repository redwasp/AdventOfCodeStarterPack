//
//  GCDTestCase.swift
//  
//
//  Created by Pavlo Liashenko on 04.01.2024.
//

import XCTest
import AdventOfCodeStarterPack

final class GCDTestCase: XCTestCase {

    func testLCM() throws {
        XCTAssertEqual(lcm(10, 12), 60)
    }
}
