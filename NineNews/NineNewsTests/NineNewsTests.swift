//
//  NineNewsTests.swift
//  NineNewsTests
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import XCTest
@testable import NineNews

class NineNewsTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        XCTAssert(true, "Pass")
    }
    
    /// Get Article From API Sets up URL Host and Path as Expected
    /// The first test case we will create is to test that the get movies method sets up URL Host and Path within the correct expectation.
    func testGetArticleWithExpectedURLHostAndPath() {
        let apiRequest: APIRequest = APIRequest()
        let mockURLSession  = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiRequest.session = mockURLSession
        apiRequest.articles { (result) in  }
        
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "bruce-v2-mob.fairfaxmedia.com.au")
        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/1/coding_test/13ZZQX/full")
    }
    
    /// Get Article From API Successfully Returns List of Articles
    /// This test is to test when the API to get articles has a successful response, the completion handler should be invoked passing the list of articles. To test asynchronous code in Xcode we can use expectation and waitForExpectation function to be fulfilled within the specified timeout we pass.
    func testGetArticleSuccessReturnArticles() {
        let jsonData = self.getMockData()
        let apiRequest: APIRequest = APIRequest()
        let mockURLSession  = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiRequest.session = mockURLSession

        let articlesExpectation = expectation(description: "articles")
        var articleResponse: [Article]?

        apiRequest.articles { (result) in
            switch result {
            case .success(let news):
                if let articles = news?.article {
                    articleResponse = articles
                    articlesExpectation.fulfill()
                }
            case .error(let error):
                print(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(articleResponse)
        }
    }
    
    /// Get Article From API with URL Response Error returns ErrorResponse
    /// This test case is to test when the dataTask completion handler has an Error it returns ResponseError.
    func testGetArticleWhenResponseErrorReturnsError() {
        let apiRequest: APIRequest = APIRequest()
        let error = NSError(domain: "error", code: 000, userInfo: nil)
        let mockURLSession  = MockURLSession(data: nil, urlResponse: nil, error: error)
        apiRequest.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: Error?
        
        apiRequest.articles { (result) in
            switch result {
            case .success( _):
               break
            case .error(let error):
                errorResponse = error
                errorExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    /// Get Article From API with Empty Data returns Error
    /// This test will check when the response returns empty data, then the completion handler will be invoked passing an Error object.
    func testGetArticleWhenEmptyDataReturnsError() {
        let apiRequest: APIRequest = APIRequest()
        let mockURLSession  = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiRequest.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: Error?
        
        apiRequest.articles { (result) in
            switch result {
            case .success( _):
                break
            case .error(let error):
                errorResponse = error
                errorExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    /// Get Article From API with Invalid JSON returns Error
    /// This test for the get articles API is to handle when an invalid JSON data is passed into object serialization returns an Error.
    func testGetArticleInvalidJSONReturnsError() {
        let jsonData = "{\"id\"}".data(using: .utf8)
        let apiRequest: APIRequest = APIRequest()
        let mockURLSession  = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiRequest.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var errorResponse: Error?
        
        apiRequest.articles { (result) in
            switch result {
            case .success(_ ):
               break
            case .error(let error):
                errorResponse = error
                errorExpectation.fulfill()
            }
        }
       
        waitForExpectations(timeout: 5) { (error) in
             XCTAssertNotNil(errorResponse)
        }
    }
    
    /// Articale View Controller Test
    func testArticleViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let articleViewController: ArticleViewController? = storyboard.instantiateViewController(withIdentifier: "articleViewController") as? ArticleViewController
        articleViewController?.loadView()
        articleViewController?.viewDidLoad()
        
        XCTAssertNotNil(articleViewController, "ArticleViewController is nil")
        XCTAssertNotNil(articleViewController?.tableView, "tableView is nil")
        XCTAssertNotNil(articleViewController?.logicController, "logicController is nil")
    }
    
    /// Article Story View Controller Test
    func testArticleStoryViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let articleStoryViewController: ArticleStoryViewController? = storyboard.instantiateViewController(withIdentifier: "articleStoryViewController") as? ArticleStoryViewController
        articleStoryViewController?.loadView()
        articleStoryViewController?.viewDidLoad()
        
        XCTAssertNotNil(articleStoryViewController, "ArticleViewController is nil")
        XCTAssertNotNil(articleStoryViewController?.webView, "webView is nil")
        XCTAssertNotNil(articleStoryViewController?.logicController, "logicController is nil")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /// Get Mock Data for API testing
    func getMockData() -> Data? {
        return "{\"id\":67184313,\"categories\":[],\"authors\":[],\"url\":\"/content/dam/lists/1/3/z/z/q/x/list.html\",\"lastModified\":1571371989403,\"onTime\":1425955024417,\"sponsored\":false,\"displayName\":\"AFR iPad Editor's Choice\",\"assets\":[],\"relatedAssets\":[],\"relatedImages\":[],\"assetType\":\"ASSET_LIST\",\"timeStamp\":1571371985740}".data(using: .utf8) ?? nil
    }
}
