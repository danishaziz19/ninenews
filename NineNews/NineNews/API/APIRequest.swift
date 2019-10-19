//
//  APIRequest.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import Foundation

/// APIResult from APIRequest result can be any genartic class
enum APIResult<T> {
    case success(T)
    case error(FetchError)
}

/// Custom Error Messsage
enum FetchError: Error {
    case api_error(message:String)
}

class APIRequest: NSObject {
    
    /// Get Articles
    ///
    /// - Parameter completion: Return Article
    func articles(completion: @escaping (_ response: APIResult<News?>) -> ()){
        guard let url = URL(string: API.articles) else { return completion(.error(.api_error(message: "URL error"))) }
       
        self.request(url) { (data, error) in
            do{
                guard let data = data else {
                    completion(.error(FetchError.api_error(message: "Data could not be retrieved")))
                    return
                }
                let article = try JSONDecoder().decode(News.self, from: data)
                print("ARTICLES: \(article)")
                completion(.success(article))
            } catch {
                print("error: \(error)")
                completion(.error(FetchError.api_error(message: error.localizedDescription)))
            }
            
        }
    }
    
    /// network request
    ///
    /// - Parameter completion: Return Data and Error
    func request(_ url: URL, completion: @escaping (Data?, Error?) -> ()) {
        let session = self.getSession()
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            completion(data, error)
            }.resume()
    }
    
    /// network Session
    ///
    /// - Parameter Return URLSession
    func getSession()-> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)
        return session
    }
}
