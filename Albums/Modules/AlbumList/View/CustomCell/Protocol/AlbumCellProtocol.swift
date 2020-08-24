//
//  AlbumCellProtocol.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

protocol AlbumCellViewModelProtocol {
    var artistID: Int? { get}
    var collectionID: Int? { get}
    var trackID: Int { get}
    var artistName: String{ get}
    var collectionName: String?{ get}
    var trackName: String{ get}
    var collectionCensoredName: String?{ get}
    var trackCensoredName: String{ get}
    var artistViewURL: String?{ get}
    var collectionViewURL: String?{ get}
    var trackViewURL: String{ get}
    var previewURL: String{ get}
    var artworkUrl : String { get}
    var collectionPrice : Double { get }
    var releaseDate : Date{get}
}
