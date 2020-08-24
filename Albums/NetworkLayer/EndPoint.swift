//
//  EndPoint.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

struct EndPoint {
    static let baseURL = "https://itunes.apple.com"
    
    struct Albums {
        static var getAlbumsList      =   EndPoint.baseURL + "/search?term=all"
    }
}

