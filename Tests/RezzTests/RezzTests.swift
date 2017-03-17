import XCTest
@testable import Rezz

class RezzTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Rezz().text, "Hello, World!")
    }


    static var allTests : [(String, (RezzTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
