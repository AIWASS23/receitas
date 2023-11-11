//
//  DessertCategoryUITestsLaunchTests.swift
//  ReceitasUITests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import XCTest

final class DessertCategoryUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
