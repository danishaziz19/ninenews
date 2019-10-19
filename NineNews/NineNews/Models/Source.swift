//
//  Source.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

struct Source: Codable {
    let tagId: String?
    
    enum CodingKeys: String, CodingKey {
        case tagId = "tagId"
    }
}
