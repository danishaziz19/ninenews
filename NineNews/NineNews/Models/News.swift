//
//  News.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

struct News: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String?
    let lastModified: Int?
    let onTime: Int?
    let sponsored: Bool?
    let displayName: String?
    let article: [Article]
    let relatedAssets: [RelatedAsset]
    let relatedImages: [AssetRelatedImage]
    let assetType: String?
    let timeStamp: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case onTime = "onTime"
        case sponsored = "sponsored"
        case displayName = "displayName"
        case article = "assets"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
        case assetType = "assetType"
        case timeStamp = "timeStamp"
    }
}
