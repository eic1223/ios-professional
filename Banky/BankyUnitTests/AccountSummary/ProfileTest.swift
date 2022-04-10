//
//  ProfileTest.swift
//  BankyUnitTests
//
//  Created by Dane's macbook pro on 2022/04/10.
//

import Foundation
import XCTest

@testable import Banky

class ProfileTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
        {
        "id": "1",
        "first_name": "Dane",
        "last_name": "Won",
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
    
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Dane")
        XCTAssertEqual(result.lastName, "Won")
    }
}
