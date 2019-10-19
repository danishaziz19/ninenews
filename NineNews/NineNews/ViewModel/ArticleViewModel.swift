//
//  ArticleViewModel.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

enum ViewModelResponse<T> {
    case success(T)
    case error(String)
}

class ArticleViewModel: NSObject {

    private let apiRequest: APIRequest = APIRequest()
    
    /// Get Articles
    ///
    /// - Parameter completion: Return Article
    func getArticle(response: @escaping (_ news: ViewModelResponse<[Article]?>) -> ()) {
        self.apiRequest.articles { (result) in
            switch result {
            case .success(let news):
                if let articles = news?.article {
                    response(.success(articles))
                }
            case .error(let error):
                response(.error(error.localizedDescription))
            }
        }
    }
}
