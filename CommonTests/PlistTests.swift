//
//  PlistTests.swift
//  Plist
//
//  Created by Benzi on 14/03/17.
//  Copyright © 2017 Benzi Ahamed. All rights reserved.
//

import XCTest
import Plist

class PlistTests: XCTestCase {
    
    func testCreateArrayWorks() {
        let p = Plist([1,2,3,4,5])
        XCTAssertEqual(p.0.int, 1)
    }
    
    func testCreateArrayWorks2() {
        let p = Plist([1,2,3,4,5])
        XCTAssertEqual(p[0].int, 1)
    }
    
    func testCreateDictWorks() {
        let p = Plist(["name": "Plist", "status": "deployed"])
        XCTAssertEqual(p.name.string, "Plist")
    }
    
    func testCreateDictWorks2() {
        let p = Plist(["name": "Plist", "status": "deployed"])
        XCTAssertEqual(p["name"].string, "Plist")
    }
    
}

