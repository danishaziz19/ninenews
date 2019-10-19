//
//  Article.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import Foundation

struct Article: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String?
    let lastModified: Int?
    let sponsored: Bool?
    let headline: String?
    let indexHeadline: String?
    let tabletHeadline: String?
    let theAbstract: String?
    let byLine: String?
    let acceptComments: Bool?
    let numberOfComments: Int?
    let relatedAssets: [RelatedAsset]?
    let relatedImages: [AssetRelatedImage]?
    let companies: [Company]?
    let legalStatus: String?
    let sources: [Source]?
    let assetType: String?
    let overrides: Overrides?
    let timeStamp: TimeInterval
    let body: String?
    let liveArticleSummary: String?
    let relatedPosts: [RelatedPost]?
    let live: Bool?
    let extendedAbstract: String?
    let onTime: Int?
    let identifier: String?
    let signPost: String?
}
