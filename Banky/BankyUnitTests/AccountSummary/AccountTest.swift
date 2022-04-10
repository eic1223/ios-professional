//
//  AccountTest.swift
//  BankyUnitTests
//
//  Created by Dane's macbook pro on 2022/04/10.
//

import Foundation
import XCTest

@testable import Banky

class AccountTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
        [
            {
                "id":"1",
                "type":"Banking",
                "name":"Basic Savings",
                "amount":929466.23,
                "createdDateTime":"2022-04-05T15:29:32Z",
            },
            {
                "id":"2",
                "type":"Banking",
                "name":"No-Fee All-In Chequing",
                "amount":17455.33,
                "createdDateTime":"2022-06-01T15:29:32Z",
            },
        ]
        """
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.count, 2)
        
        let account1 = result[0]
        
        XCTAssertEqual(account1.name, "Basic Savings")
    }
}
