import XCTest
@testable import Rezz

class RezzTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(resolve(hostname: "localhost"), "127.0.0.1")
    }


    static var allTests : [(String, (RezzTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
