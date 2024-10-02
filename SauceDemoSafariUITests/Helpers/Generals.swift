//
//  Generals.swift
//  SauceDemoSafari
//
//  Created by Guido Wira on 30/09/24.
//
import XCTest

struct Generals {
    static func launchWebsites(safari: XCUIApplication) {
        safari.open(Config.url!)
    }
}

extension XCUIElement {
    func scrollToElementUntilFirstMatch(element: XCUIElement, maxScrolls: Int = 10) {
        var currentScroll = 0
        while !element.firstMatch.exists && currentScroll < maxScrolls {
            swipeUp()
            currentScroll += 1
        }
    }
    
    func scrollDownUntilFirstMatch(element: XCUIElement, maxScrolls: Int = 10){
        var currentScroll = 0
        while !element.firstMatch.exists && currentScroll < maxScrolls {
            swipeDown()
            currentScroll += 1
        }
    }
    
    var hasFocus: Bool{
        return self.value(forKey: "hasKeyboardFocus") as? Bool ?? false
    }
}
