# TDD
Tests:
A procedure intended to establish the software quality, performance, or reliability, especially before it is shipped to the users.

Manual tests:

You can launch an iOS app in the Simulator and click through its UI to check it behaves as you programmed it to. Or you can submit data using a form in a web application and then check that the database contains it.All the preceding examples share a trait: someone has to exercise the software and verify its behavior. We can then run it with a specific input and verify it uses it in the salutation. They are manual tests.To consistently ship quality software on a schedule, manual testing is not enough.

Automated Tests:
Code that checks other code – that’s what automated testing is.

We can also automate the automated tests to never forget running them. For example, if you use Git, you could set up a hook that runs them before every commit.


Reading material about software testing, you’ll come across a variety of names for automated tests. Unit testing, integration testing, UI testing, property-based testing, exploratory testing, characterization testing, … the list goes on. It’s overwhelming, to say the least, and to make matters worse, different people or resources have different interpretations of what certain names actually mean.


Unit Test:
A unit test is a piece of code that invokes a unit of work and checks one specific end result of that unit of work.

UI Testing: 
Use UI tests for verifying the user interface and interactions, especially for flows that are critical to the user experience.

Integration Testing: 
When multiple components interact (e.g., networking and database), ensure that they work together as expected.

From Writing Tests to Writing Tests First:
There is a problem with writing tests for code that already exists: you can’t truly trust a test you haven’t seen failing.The only way to make sure your tests are not giving you a false positive – that they pass even though the code is wrong – is to modify the code’s behavior to force a failure and see if they catch it.Forcing failures in production code to verify the tests’ correctness is not an efficient approach. It requires changing code you already wrote, only to undo the change right after, once you validated the test.How can we verify that our tests are correct without going through the trouble of creating ad hoc failures?The answer is by spinning the process around and writing the tests first.By writing a test for something you haven’t implemented yet, you can ensure the test will catch errors. That’s because if there is not code for the behavior yet, the test must fail; if it doesn’t, then it’s not written correctly.”

TDD:
We got to a working “fizz-buzz” implementation by building it one step at a time, always starting from a failing test. Because each test represented a specific case of the overall “fizz-buzz” behavior, the code changed between iterations was always minimal. On each step, the test for the new behavior helped us verify if our new code worked without the need to call it manually multiple times, while the already existing tests ensured it didn’t break the rest of the logic.


“This test-first, step-by-step, fast-feedback way of writing code is incredibly effective. It’s a unique way of building software called Test-Driven Development, TDD for short.”

“Test-Driven Development is the intentional and consistent use of the tests’ feedback to inform the software implementation. But practicing TDD is more than just writing tests before production code; its by-products are far more valuable than the mere knowledge that your software behaves as expected.”

Writing tests first puts helpful pressure on your software design. Environmental constraints and natural selection resulted in the evolution of the beautiful and advanced species that make up our world’s flora and fauna. In the same way, forcing yourself to write tests first will push you and your codebase to a higher standard.

“When you write tests first, you immediately see if your design is simple to test. Straightforward and isolated behavior is simpler to test than complicated one. A big object with many dependencies is harder to put in a test harness than a smaller one with only a few init parameters.”

“If code is straightforward to test, it will also be straightforward to work with it in production. That’s because tests are consumers of the code’s public API. Using code in the test is similar to using it in production.”

“Because writing simple tests is easier than writing complicated ones, you’ll naturally gravitate toward code that is isolated and does only one thing. You’ll build software made up of highly cohesive and loosely coupled components.”

“TDD also helps you have a better understanding of your products’ requirements. To test your code’s behavior, you need to know what it is first: you need to define inputs and their expected outputs concretely. To do so, you need to have appropriately assimilated the requirements for what the software should do. This upfront analysis makes implementing the code straightforward. Writing tests first removes the temptation to skip this critical step.”

“TDD gives you a psychological advantage. Developing your software one test at a time sets a sustainable pace, and our brains achieve goals better when the end is in sight”

“Tackling the development of large complex applications one test at a time is the equivalent of how marathon runners approach their long races: putting one foot in front of the other.”

“Test-Driven Development is the keystone habit of software quality. When applied day after day, it has huge ripple effects on developer productivity, happiness, and software design quality.”

“If you’re happy slamming some code together that more or less works and you’re happy never looking at the result again, TDD is not for you. TDD rests on a charmingly naïve geekoid assumption that if you write better code, you’ll be more successful. TDD helps you to pay attention to the right issues at the right time so you can make your designs cleaner, you can refine your designs as you learn.”

XCTest:

A testing library, or framework in Swift terminology, provides the scaffold on which to build tests, run them, and gather their results. In the Apple ecosystem, XCTest is the default testing framework, and it comes bundled with the Xcode IDE. The same Test-Driven Development applies, whether you use vanilla XCTest only or augment your setup with other testing libraries.

There are other testing frameworks for Swift made by the open source community, Quick and Nimble are other frameworks.

“Conversely, tests in the unit test target run hosted in the application and have access to all the objects and types from its source code. This is exactly what we need to write tests first and use them as a fast-feedback mechanism on the correctness of the implementation.”

“In an Xcode unit test target, you are not limited to test where the object under inspection is isolated from the rest of the program; you can also write integration tests and any other kind of test where you may need to instantiate some of the objects in the source code directly, like snapshot or property-based testing.”

Assertions:
XCTAssertEqual
XCTAssertNotEqual
XCTAssertTrue
XCTAssertFalse
XCTAssertNil
XCTAssertNotNil
XCTAssertLessThan
XCTAssertGreaterThan
XCTAssertLessThanOrEqual
XCTAssertGreaterThanOrEqual
XCTAssertThrowsError
XCTAssertNoThrow
XCTUnwrap
XCTFail

Expectation
XCTestExpectation with wait statement

To learn: Async/await with Test cases


XCTestCase Life Cycle:

```swift
class LifeCycleExampleTest: XCTestCase {
    override class func setUp() {
        print("This runs before all tests")
    }    
    
    override func setUpWithError() throws {
       print("This runs before each test")
    }
    
    override func tearDownWithError() throws {
       print("This runs after each test")
    }
    
    override class func tearDown() {
       print("This runs after all tests")
    }
    
    func testA() throws {
       print("This is test A")
    }
    
    func testB() throws {
       print("This is test B")
    }
```
Injection:

“As your code becomes more complicated, it might seem tempting to simplify your tests by preparing the components needed in the setUp methods or to clean up the state of the app after the tests run in the tearDown methods.”

SetUp and TearDown:
“When your tests become complicated to set up, they are sending you a signal that the software design is getting complicated too. More often than not, using setUp and tearDown is the wrong answer to the problem of keeping tests tidy.”

“You’re better off taking a step back and simplifying your design, perhaps by dividing an object with too many responsibilities into two or by injecting configurations rather than depending on the global state.”
“when adding tests to code that depends on global state and doesn’t have tests before making a change. Here, you should add your tests before making any change to the code, and so the life cycle methods are useful to start writing tests. Once you have your tests in place, you can refactor with confidence and remove the dependency on global state and the need to hook into the test life cycle.”
“setUp and tearDown are useful to prepare the app for the execution of certain UI tests and to clean up its state afterward.”


AAA Design Pattern:
In the context of XCTest for SwiftUI, the "AAA" pattern typically refers to the Arrange, Act, Assert pattern. This pattern is commonly used in unit testing to structure tests in a clean and organized manner.

Arrange: Set up the necessary preconditions, state, or data for the test. Prepare your environment (views, controllers, data).
Act: Perform the action that triggers the behavior you're testing (e.g., button press, state change). Trigger the behavior you're testing (e.g., a button press).
Assert: Verify that the expected result occurs based on the action performed. Verify the expected results (e.g., checking a label or value change).

--start from page 23



