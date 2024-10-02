//
//  Products.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 01/10/24.
//

import XCTest

struct Products {
    static func directAddToCart(safari: XCUIApplication) {
        safari.scrollToElementUntilFirstMatch(element: safari.buttons["Add to cart"])
        safari.buttons["Add to cart"].firstMatch.tap()
    }
    
    static func indirectAddToCart(safari: XCUIApplication, productName: String) {
        safari.scrollToElementUntilFirstMatch(element: safari.links[productName])
        safari.links[productName].firstMatch.tap()
        
        safari.scrollToElementUntilFirstMatch(element: safari.buttons["Add to cart"])
        safari.buttons["Add to cart"].firstMatch.tap()
    }
    
    static func backToProductList(safari: XCUIApplication) {
        safari.scrollDownUntilFirstMatch(element: safari.buttons["Back to products"])
        safari.buttons["Back to products"].tap()
    }
    
    static func sortFromLow(safari: XCUIApplication) {
        let sortDropdown = safari.descendants(matching: .any).matching(identifier: "product-sort-container").element
               
        sortDropdown.tap()
               
        let lohi = safari.descendants(matching: .any).matching(identifier: "lohi").element
        lohi.tap()
    }
    
}

