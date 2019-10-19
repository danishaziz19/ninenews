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
    let onTime: Int?
    let sponsored: Bool?
    let displayName: String?
    let assets: [Asset]
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
        case assets = "assets"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
        case assetType = "assetType"
        case timeStamp = "timeStamp"
    }
}

// MARK: - Asset
struct Asset: Codable {
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


// MARK: - Author
struct Author: Codable {
    let name: String
    let title: String
    let email: String
    let relatedAssets: [RelatedAsset]
    let relatedImages: [AssetRelatedImage]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case title = "title"
        case email = "email"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String
    let sectionPath: String
    let orderNum: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case sectionPath = "sectionPath"
        case orderNum = "orderNum"
    }
}

// MARK: - Overrides
struct Overrides: Codable {
    let overrideHeadline: String?
    let overrideAbstract: String?
    let overrideIdentifier: String?
    
    enum CodingKeys: String, CodingKey {
        case overrideHeadline = "overrideHeadline"
        case overrideAbstract = "overrideAbstract"
        case overrideIdentifier = "overrideIdentifier"
    }
}

// MARK: - Source
struct Source: Codable {
    let tagId: String?
    
    enum CodingKeys: String, CodingKey {
        case tagId = "tagId"
    }
}


// MARK: - Company
struct Company: Codable {
    let id: Int?
    let companyCode : String?
    let companyName: String?
    let abbreviatedName: String?
    let exchange: String?
    let companyNumber: String?
}


// MARK: - RelatedPost
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


// MARK: - RelatedAsset
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


// MARK: - AssetRelatedImage
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
