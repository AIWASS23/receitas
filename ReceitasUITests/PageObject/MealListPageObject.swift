//
//  MealListPageObject.swift
//  ReceitasUITests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import XCTest

class MealListPageObject {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var mealImage: XCUIElement {
        app.images["mealsViewImage"]
    }
    
    var mealName: XCUIElement {
        app.staticTexts["mealsViewName"]
    }
    
    var mealScrollView: XCUIElement {
        app.scrollViews["mealScrollListView"]
    }
}
