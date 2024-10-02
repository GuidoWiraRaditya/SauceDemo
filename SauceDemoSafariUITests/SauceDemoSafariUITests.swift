//
//  SauceDemoSafariUITests.swift
//  SauceDemoSafariUITests
//
//  Created by Guido Wira on 30/09/24.
//

import XCTest

final class SauceDemoSafariUITests: XCTestCase {
    
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        safari.launch()
    }

    override func tearDownWithError() throws {
        safari.terminate()
        try super.tearDownWithError()
    }


    func testCheckoutItems() throws {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        Generals.launchWebsites(safari: safari)
        Login.login(safari:safari)
        Login.dismissSavePasswordPrompt(safari: safari)
        Products.directAddToCart(safari:safari)
        Products.indirectAddToCart(safari: safari, productName: "Sauce Labs Bike Light")
        Carts.accessCart(safari: safari)
        Carts.checkOut(safari: safari)
        Payments.fillAddress(safari: safari)
        Payments.continueProcess(safari: safari)
        Payments.finishTransaction(safari: safari)
        Assertions.assertCheckoutSuccess(safari: safari)
        
    }
    
    func testPerformanceGlitchUser() throws {
        Generals.launchWebsites(safari: safari)
        Login.login(safari:safari, username: Config.glitchUsername, password: Config.password)
        Login.dismissSavePasswordPrompt(safari: safari)
        Products.sortFromLow(safari: safari) /*The test fails at this point because it cannot find the Sort icon. Based on my research, there currently isn't a way to access any element with <div>, <span>, or <class>, even when using a data-test-id. As far as I know, XCUITest does not support XPath to access elements inside Safari. However, if there is a way to access the Sort icon, I would love to learn about it, as I'm eager to expand my knowledge as an Automation Tester. Thank you for your assistance! You can reach me at aditbaskoro21@gmail.com.*/
        Products.directAddToCart(safari:safari)
        Carts.accessCart(safari: safari)
        Carts.checkOut(safari: safari)
        Payments.fillAddress(safari: safari)
        Payments.continueProcess(safari: safari)
        Payments.finishTransaction(safari: safari)
        Assertions.assertCheckoutSuccess(safari: safari)
    }
    
    func testLockedOutUser() throws {
        Generals.launchWebsites(safari: safari)
        Login.login(safari:safari, username: Config.lockedUsername, password: Config.password)
        Login.dismissSavePasswordPrompt(safari: safari)
        Products.directAddToCart(safari:safari)
        Products.indirectAddToCart(safari: safari, productName: "Sauce Labs Bike Light")
        Carts.accessCart(safari: safari)
        Carts.checkOut(safari: safari)
        Payments.fillAddress(safari: safari)
        Payments.continueProcess(safari: safari)
        Payments.finishTransaction(safari: safari)
        Assertions.assertCheckoutSuccess(safari: safari)
    }
    
    /*
     This issue is quite tricky. In the UI, we see an error message that says, "Epic sadface: Sorry, this user has been locked out," which indicates there's a problem with the account's authentication process. However, when we check the Network tab and Console in the developer tools, we also see that the issue is related to CORS, which affects the server.
     To fix this, we can do two things:

     1. If the user was locked out due to any violations, we can ask the DBA and inform the Team Lead to update the user's status accordingly.
     2. If the root cause is a CORS issue, we need to ask the back-end engineer to investigate and fix the CORS configuration. It's likely a CORS configuration issue rather than a front-end problem, as the login form doesn't use an iFrame.
     */
    
    func testProblemUser() throws {
        Generals.launchWebsites(safari: safari)
        Login.login(safari:safari, username: Config.lockedUsername, password: Config.password)
        Login.dismissSavePasswordPrompt(safari: safari)
        Products.directAddToCart(safari:safari)
        Products.indirectAddToCart(safari: safari, productName: "Sauce Labs Bike Light")
        Carts.accessCart(safari: safari)
        Carts.checkOut(safari: safari)
        Payments.fillAddress(safari: safari)
        Payments.continueProcess(safari: safari)
        Payments.finishTransaction(safari: safari)
        Assertions.assertCheckoutSuccess(safari: safari)
    }
    /*Test Problem User will fail because of this reason:
    1. JavaScript issue on the product page: Some of the "Add to Cart" buttons can't be clicked. If the user tries to access the product, they are redirected to the product page of a different item. This is not a back-end issue, as checking the Network tab in the developer tools shows no errors. You can check the browser's console to see where the JavaScript issue occurs.
     How to fix it? Ask a front-end engineer to investigate and resolve the JavaScript issue.

     2. If the JavaScript issue has been fixed but the problem persists: We may need to check the back-end configuration, particularly the connection with the S3 bucket (if we're using AWS). Incorrectly displayed images are often linked to S3 bucket configuration issues.
     How to fix it? Ask a back-end engineer to review and resolve any configuration issues with the S3 bucket.

     3. JavaScript issue on the user info step during checkout: When the user tries to type in the "Last Name" field, the JavaScript inserts the last character the user typed and replaces the first name with it. This is clearly a front-end issue, as this kind of behavior is typically caused by JavaScript errors in web applications.
     How to fix it? Ask a front-end engineer to check the JavaScript logic related to the "Last Name" field.
     */

}
