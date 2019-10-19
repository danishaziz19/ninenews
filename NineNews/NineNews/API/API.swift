//
//  API.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import Foundation

// Client can be staging or production
struct Client {
    private static let staging = "https://bruce-v2-mob.fairfaxmedia.com.au/"
    private static let production = "https://bruce-v2-mob.fairfaxmedia.com.au/"
    
    static var baseURL: String {
        return staging
    }
}

// Api URLs
struct API {
    static let articles = Client.baseURL + "1/coding_test/13ZZQX/full"
}


