//
//  Overrides.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

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
