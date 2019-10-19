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
    func getArticle(response: @escaping (_ artical: ViewModelResponse<[Asset]?>) -> ()) {
        self.apiRequest.articles { (result) in
            switch result {
            case .success(let article):
                if let articles = article?.assets {
                    response(.success(articles))
                }
            case .error(let error):
                response(.error(error.localizedDescription))
            }
        }
    }
}
