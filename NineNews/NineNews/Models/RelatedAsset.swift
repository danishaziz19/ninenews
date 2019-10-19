//
//  RelatedAsset.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

struct RelatedAsset: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String?
    let lastModified: Int?
    let onTime: Int?
    let sponsored: Bool?
    let assetType: String?
    let headline: String?
    let timeStamp: Int?
}
