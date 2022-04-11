//
//  AccountSummaryViewControllerTest.swift
//  BankyUnitTests
//
//  Created by Dane's macbook pro on 2022/04/11.
//

import Foundation
import XCTest

@testable import Banky

class AccountSummaryViewControllerTest: XCTestCase {
    var vc: AccountSummaryViewController! // = AccountSummaryViewController()
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>)->Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        //vc.loadViewIfNeeded()
        
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }

    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
    
    }
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        vc.forceFetchProfile()
        
        XCTAssertEqual("Server Error", vc.errorAlert.title)
    }
}
