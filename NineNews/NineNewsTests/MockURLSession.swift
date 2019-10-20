//
//  MockURLSession.swift
//  NineNewsTests
//
//  Created by Danish Aziz on 20/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

// Mock URLSession
class MockURLSession: URLSession {
    var cachedUrl: URL?
    private let mockTask: MockTask
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, error:
            error)
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = request.url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}

// Mock URLSessionDataTask
class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let error1: Error?
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error1 = error
    }
    
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.data, self.urlResponse, self.error1)
        }
    }
}
