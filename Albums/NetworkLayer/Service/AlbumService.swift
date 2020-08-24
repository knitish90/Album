//
//  TrackService.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

protocol AlbumserviceProtocol {
    func getAlbumList(completion : @escaping (Errors?, Album?) -> Void)
}


class Albumservice : AlbumserviceProtocol {
    
    var httpClient : HTTPClientProtocol
    var responseHandler : ResponseHandler!
    
    required init(httpClient : HTTPClientProtocol, handler : ResponseHandler = ResponseHandler()) {
        self.httpClient         =   httpClient
        self.responseHandler    =   handler
    }
    
    func getAlbumList(completion: @escaping (Errors?, Album?) -> Void) {
        httpClient.getData(urlString: EndPoint.Albums.getAlbumsList) { (data, error) in
            self.responseHandler.parseResponse(data, error) { (album, error) in
                completion(error,album)
            }
        }
    }
}

