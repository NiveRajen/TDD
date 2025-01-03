//
//  TDDUITests.swift
//  TDDUITests
//
//  Created by Nivedha Rajendran on 14.11.24.
//

import XCTest
import SwiftUI
@testable import TDD

final class TDDUITests: XCTestCase {
    
    private var hostingVC: UIViewController!
    
    override func setUp() {
        
        //Arrange
        let contentView = ContentView(model: FizzBuzzViewModel(), input: 3)
        
        hostingVC = UIHostingController(rootView: contentView)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    func testTappedCount() {
     
        //Act
        if let buttons = hostingVC.view.subviews.first(where: { $0 is UIButton }) as? UIButton {
            buttons.sendActions(for:.touchUpInside)
        }
        
        //Assert
        if let textLabel = hostingVC.view.subviews.first(where: { $0 is UILabel }) as? UILabel {
            XCTAssertEqual(textLabel.text, "Tapped Count: 1")
        }
    }
}
