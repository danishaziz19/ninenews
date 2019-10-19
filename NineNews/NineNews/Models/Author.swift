//
//  Author.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

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
