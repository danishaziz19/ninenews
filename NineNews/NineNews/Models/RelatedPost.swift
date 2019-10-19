//
//  RelatedPost.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

struct RelatedPost: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let lastModified: Int?
    let sponsored: Bool?
    let headline : String
    let body: String?
    let authorNames: String?
    let relatedAssets: [RelatedAsset]
    let relatedImages: [AssetRelatedImage]
    let assetType: String?
    let extendedAbstract: String?
    let timeStamp: Int?
}
