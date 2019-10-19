//
//  Category.swift
//  NineNews
//
//  Created by Danish Aziz on 19/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

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
