//
//  AssetRelatedImage.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

struct AssetRelatedImage: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    //let brands
    let url: String?
    let lastModified: Int?
    let sponsored: Bool?
    let relatedImageDescription: String?
    let photographer: String?
    let type: String?
    let width: Int?
    let height: Int?
    let assetType: String?
    let timeStamp: Int?
    let xLarge2X, xLarge, large2X, large: String?
    let thumbnail2X, thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case id, categories, authors, url, lastModified, sponsored
        case relatedImageDescription = "description"
        case photographer, type, width, height, assetType, timeStamp
        case xLarge2X = "xLarge@2x"
        case xLarge
        case large2X = "large@2x"
        case large
        case thumbnail2X = "thumbnail@2x"
        case thumbnail
    }
}

enum FluffyType: String, Codable {
    case afrArticleInline = "afrArticleInline"
    case afrArticleLead = "afrArticleLead"
    case afrIndexLead = "afrIndexLead"
    case articleLeadNarrow = "articleLeadNarrow"
    case articleLeadWide = "articleLeadWide"
    case landscape = "landscape"
    case thumbnail = "thumbnail"
    case wideLandscape = "wideLandscape"
}
