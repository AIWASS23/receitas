//
//  MealDetailsPageObject.swift
//  ReceitasUITests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import XCTest

class MealDetailsPageObject {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var mealInstruction: XCUIElement {
        app.staticTexts["mealIngredient"]
    }
}
