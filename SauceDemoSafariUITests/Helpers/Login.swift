//
//  Login.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 01/10/24.
//

import XCTest

struct Login{
    static func dismissSavePasswordPrompt(safari: XCUIApplication) {
        let notNowButton = safari.alerts.buttons["Not Now"]
        if notNowButton.exists {
            notNowButton.tap()
        }
    }
    
    static func login(safari: XCUIApplication, username: String = Config.username, password: String = Config.password) {
        XCTAssertTrue(safari.textFields["Username"].waitForExistence(timeout: 10), "User name text field did not appear")
        safari.textFields["Username"].tap()
        if !safari.textFields["Username"].hasFocus {
            safari.textFields["Username"].tap()
        }
        safari.textFields["Username"].typeText(username)
        
        safari.secureTextFields["Password"].firstMatch.tap()
        safari.secureTextFields["Password"].typeText(password)
        
        safari.buttons["Login"].tap()
    }
}
