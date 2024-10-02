//
//  Carts.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 01/10/24.
//

import XCTest

struct Carts {
    static func accessCart(safari: XCUIApplication) {

        let cart = "https://www.saucedemo.com/cart.html"
        let cartUrl = URL(string: cart)!
        safari.open(cartUrl)
    }
    
    static func checkOut(safari: XCUIApplication) {
        safari.scrollToElementUntilFirstMatch(element: safari.buttons["Checkout"])
        safari.buttons["Checkout"].tap()
    }
}
