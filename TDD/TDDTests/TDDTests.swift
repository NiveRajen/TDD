//
//  TDDTests.swift
//  TDDTests
//
//  Created by Nivedha Rajendran on 14.11.24.
//

import XCTest
@testable import TDD

final class TDDTests: XCTestCase {

    private var viewModel: FizzBuzzViewModel!
    
    
    override func setUp() {
        viewModel = FizzBuzzViewModel()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //Simple Testing
    func testFizzBuzz() {
        XCTAssertEqual(viewModel.fizzBuzz(3), "fizz")
        XCTAssertEqual(viewModel.fizzBuzz(5), "buzz")
        XCTAssertEqual(viewModel.fizzBuzz(15), "fizz-buzz")
        XCTAssertNotEqual(viewModel.fizzBuzz(1), "fizz-buzz")
    }
    
    //Testing Optional Values
    func testUserData() {
        do {
            let user: User = try XCTUnwrap(viewModel.user)
            
            XCTAssertEqual(user.fullName(), "Nivedha Rajendran")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    //Testing Asynchronous functions - Method 1
    func testSum1() {
        var sum = 0
        let expectation = XCTestExpectation(description: "Sum completed")
        
        viewModel.asyncSum(value1: 1, value2: 2) { result in
            sum = result
            expectation.fulfill()
        }
        
        wait(for: [expectation])
        XCTAssertEqual(sum, 3)
    }
    
    //Testing Asynchronous functions - Method 2
    func testSum2() {
        let expectation = XCTestExpectation(description: "Sum completed")
        
        viewModel.asyncSum(value1: 1, value2: 2) { result in
            XCTAssertEqual(result, 3)
            expectation.fulfill()
        }
        
        wait(for: [expectation])
        
    }
    
}
