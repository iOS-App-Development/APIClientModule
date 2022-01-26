import XCTest
@testable import APIClientModule
import HTTPClientModule

final class APIClientModuleTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(APIClientModule().text, "Hello, World!")
    }
    
    private func ephemeralClient(file: StaticString = #filePath, line: UInt = #line) -> HTTPClient {
        let client = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
//        trackForMemoryLeaks(client, file: file, line: line)
        return client
    }

    func test_endToEndTestServerGETFruits() {
        let service = HomeService.init(httpClient: ephemeralClient(), baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)
        let exp = expectation(description: "Wait for load completion")
        
        service.getMoviePopularList { resultObjects in
            switch resultObjects {
            case let .success(fruits)?:
                print("how many objects %d",fruits.count)
                XCTAssertEqual(fruits.count, 20, "Expected fruit 20 count")
            case let .failure(error)?:
                XCTFail("Expected successful fruits result, got \(error) instead")
                
            default:
                XCTFail("Expected successful fruits result, got no result instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5.0)
    }
}
