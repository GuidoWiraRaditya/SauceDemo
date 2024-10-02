//
//  Payments.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 01/10/24.
//

import XCTest

struct Payments {
    
    static func fillAddress(safari: XCUIApplication) {
        XCTAssertTrue(safari.textFields["First Name"].waitForExistence(timeout: 10), "First name text field did not appear")
        safari.textFields["First Name"].tap()
        safari.textFields["First Name"].typeText(Config.firstName)
        
        safari.textFields["Last Name"].tap()
        safari.textFields["Last Name"].typeText(Config.lastName)
        
        safari.textFields["Zip/Postal Code"].tap()
        safari.textFields["Zip/Postal Code"].typeText(Config.postalCode)
    }
    
    static func continueProcess(safari: XCUIApplication) {
        XCTAssertTrue(safari.buttons["Continue"].waitForExistence(timeout: 10), "Continue button did not appear")
        safari.buttons["Continue"].tap()
    }
    
    static func finishTransaction(safari: XCUIApplication) {
        safari.scrollToElementUntilFirstMatch(element: safari.buttons["Finish"])
        safari.buttons["Finish"].tap()
    }
}
