//
//  TimeIntervalExtenstion.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

extension TimeInterval {

    /// value convert to date
    var date: Date {
        return Date(timeIntervalSince1970: self / 1000.0)
    }
    
}
