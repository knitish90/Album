//
//  AlbumCellModel.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

struct AlbumCellModel : AlbumCellViewModelProtocol {
    var artworkUrl: String
    var artistID: Int?
    var collectionID: Int?
    var trackID: Int
    var artistName: String
    var collectionName: String?
    var trackName: String
    var collectionCensoredName: String?
    var trackCensoredName: String
    var artistViewURL: String?
    var collectionViewURL: String?
    var trackViewURL: String
    var previewURL: String
    var collectionPrice : Double
    var releaseDate: Date
    init(result : Result) {
        self.artistID = result.artistID
        self.collectionID  =    result.collectionID
        self.trackID    =   result.trackID
        self.artistName =   result.artistName
        self.artistName =   result.artistName
        self.collectionName =   result.collectionName
        self.trackName =   result.trackName
        self.collectionCensoredName =   result.collectionCensoredName
        self.artistViewURL =   result.artistViewURL
        self.collectionViewURL =   result.collectionViewURL
        self.trackViewURL =   result.trackViewURL
        self.previewURL =   result.previewURL
        self.trackCensoredName =   result.trackCensoredName
        self.artworkUrl  =   result.artworkUrl100
        self.collectionPrice    =   result.collectionPrice
        self.releaseDate    =   result.releasedDate
    }
    
}
