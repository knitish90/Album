//
//  MockedAlbumService.swift
//  AlbumTests
//
//  Created by Nitish.kumar on 29/03/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation
@testable import Albums

class MockedAlbumservice : Albumservice {
    
    var responseString : String?
    
    init(albumString : String?) {
        self.responseString = albumString
        super.init(httpClient: HTTPClient())
    }
    
    required init(httpClient: HTTPClientProtocol, handler: ResponseHandler = ResponseHandler()) {
        super.init(httpClient: httpClient, handler: handler)
    }
    
    override func getAlbumList(completion: @escaping (Errors?, Album?) -> Void) {
        ResponseHandler().parseResponse(responseString?.data(using: .utf8), nil) { (album, error) in
            completion(error, album)
        }
    }
}
