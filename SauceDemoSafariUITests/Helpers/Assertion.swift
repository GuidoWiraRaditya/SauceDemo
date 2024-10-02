//
//  Assertion.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 30/09/24.
//

import XCTest

struct Assertions{
    static func assertCheckoutSuccess(safari: XCUIApplication) {
        XCTAssertTrue(safari.staticTexts["Thank you for your order!"].exists, "Checkout did not complete successfully")
    }
}
