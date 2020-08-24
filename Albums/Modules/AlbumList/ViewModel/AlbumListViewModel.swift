//
//  ContactListViewModel.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation


enum SortOptions: String, CaseIterable {
    case ArtistName = "Artist name"
    case TrackName  =   "Track name"
    case CollectionName =   "Collection name"
    case CollectionPrice    =   "Collection price"
}

class AlbumListViewModel: AlbumListViewModelProtocol {
    var dataSource: [AlbumCellViewModelProtocol]
    var sortedDataSource :  [AlbumCellViewModelProtocol]
    var didDataLoaded: ((Errors?) -> Void)?
    var service: AlbumserviceProtocol
    var album: Album!
    
    init(service: AlbumserviceProtocol) {
        self.service = service
        dataSource = []
        sortedDataSource = []
    }
    
    func cellViewModel(for index: Int) -> AlbumCellViewModelProtocol {
        let cellModel   =   AlbumCellModel(result: album.results[index])
        return cellModel
    }
    
    func prepareDataSource(with sortOptions : SortOptions) {
        self.dataSource = album.results.map{AlbumCellModel(result: $0)}
        self.dataSource = getFilterData(with: sortOptions)
    }
    
    func getFilterData(with sortOptions : SortOptions) -> [AlbumCellViewModelProtocol]  {
        switch sortOptions {
        case .ArtistName:
            return dataSource.sorted { (id1, id2) -> Bool in
                return id1.artistName < id2.artistName
            }
        case .TrackName:
            return dataSource.sorted { (id1, id2) -> Bool in
                return id1.trackName < id2.trackName
            }
        case .CollectionName:
            return dataSource.sorted { (id1, id2) -> Bool in
                return (id1.collectionName ?? "") < (id2.collectionName ?? "")
            }
        case .CollectionPrice:
            return dataSource.sorted { (id1, id2) -> Bool in
                return id1.collectionPrice < id2.collectionPrice
            }
        }
    }
    func fetchAlbums() {
        service.getAlbumList{ (error, album) in
            DispatchQueue.main.async {
                self.album  =   album
                self.prepareDataSource(with: .ArtistName)
                self.didDataLoaded?(error)
            }
        }
    }
}
