//
//  URLCoder.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

class URLEncoder {
    func encode(_ urlString: String, _ params: Params) -> URL? {
        var components = URLComponents()
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        var encodedParams = components.url?.absoluteString ?? ""
        if encodedParams == "?"{
            encodedParams = ""
        }
        let encodedUrl = urlString + encodedParams
        return URL(string: encodedUrl)
    }
}

