//
//  Tracks.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

struct Album: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let artistID, collectionID: Int?
    let trackID: Int
    let artistName: String
    let collectionName: String?
    let trackName: String
    let collectionCensoredName: String?
    let trackCensoredName: String
    let artistViewURL, collectionViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl100: String
    let collectionPrice: Double
    let releaseDate : String
    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName,artworkUrl100, collectionPrice, releaseDate
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
    }
}
//// MARK: - Result
//struct Result: Codable {
//    let wrapperType: WrapperType
//    let kind: Kind
//    let artistID, collectionID: Int?
//    let trackID: Int
//    let artistName: String
//    let collectionName: String?
//    let trackName: String
//    let collectionCensoredName: String?
//    let trackCensoredName: String
//    let artistViewURL, collectionViewURL: String?
//    let trackViewURL: String
//    let previewURL: String
//    let artworkUrl30, artworkUrl60, artworkUrl100: String
//    let collectionPrice, trackPrice: Double
//    let releaseDate: Date
//    let collectionExplicitness, trackExplicitness: Explicitness
//    let discCount, discNumber, trackCount, trackNumber: Int?
//    let trackTimeMillis: Int
//    let country: Country
//    let currency: Currency
//    let primaryGenreName: String
//    let contentAdvisoryRating: String?
//    let isStreamable: Bool?
//    let collectionArtistID: Int?
//    let collectionArtistViewURL: String?
//    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
//    let shortDescription, longDescription: String?
//    let hasITunesExtras: Bool?
//    let collectionArtistName: String?
//
//    enum CodingKeys: String, CodingKey {
//        case wrapperType, kind
//        case artistID = "artistId"
//        case collectionID = "collectionId"
//        case trackID = "trackId"
//        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
//        case artistViewURL = "artistViewUrl"
//        case collectionViewURL = "collectionViewUrl"
//        case trackViewURL = "trackViewUrl"
//        case previewURL = "previewUrl"
//        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, isStreamable
//        case collectionArtistID = "collectionArtistId"
//        case collectionArtistViewURL = "collectionArtistViewUrl"
//        case trackRentalPrice
//        case collectionHDPrice = "collectionHdPrice"
//        case trackHDPrice = "trackHdPrice"
//        case trackHDRentalPrice = "trackHdRentalPrice"
//        case shortDescription, longDescription, hasITunesExtras, collectionArtistName
//    }
//}
//
//enum Explicitness: String, Codable {
//    case explicit = "explicit"
//    case notExplicit = "notExplicit"
//}
//
//enum Country: String, Codable {
//    case usa = "USA"
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}
//
//enum Kind: String, Codable {
//    case featureMovie = "feature-movie"
//    case song = "song"
//}
//
//enum WrapperType: String, Codable {
//    case track = "track"
//}
