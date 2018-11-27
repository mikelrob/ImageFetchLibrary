import XCTest
@testable import ImageFetchLibrary

final class ImageFetchLibraryTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ImageFetchLibrary().homeUrl.absoluteString, "https://github.com/mikelrob")
    }
}
