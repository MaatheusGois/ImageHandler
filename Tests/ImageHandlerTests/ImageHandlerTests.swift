import XCTest
@testable import ImageHandler

final class ImageHandlerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ImageHandler().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
