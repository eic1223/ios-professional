//
//  ViewControllerTest.swift
//  PasswordTests
//
//  Created by Dane's macbook pro on 2022/04/13.
//

import Foundation

@testable import Password
import XCTest

class ViewControllerTests_NewPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    /*
     Here we trigger those criteria blocks by entering text,
     clicking the reset password button, and then checking
     the error label for the right messages.
     */
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter your password.")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = "as df asdf"
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter valid special chars (.,!@#$%^&*()?) with no spaces.")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Your password must meet the requirements below.")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "")
    }
}



class ViewControllerTests_Confirm_Password_Validation: XCTestCase {
    
    var vc: ViewController!
    let validPw = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Enter Your password.")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPw
        vc.confirmPasswordText = tooShort
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Password do not match.")
    }
    
    func testPasswordsMatch() throws {
        vc.newPasswordText = validPw
        vc.confirmPasswordText = validPw
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "")
    }
}


class ViewControllerTests_Show_Alert: XCTestCase {
    
    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success") // Optional
    }
    
    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.confirmButtonTapped(sender: UIButton())
        
        XCTAssertNil(vc.alert)
    }
}
