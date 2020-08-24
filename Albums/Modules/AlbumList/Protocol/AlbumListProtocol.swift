//
//  TrackListProtocol.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation

protocol AlbumListViewModelProtocol {
    func fetchAlbums()
    var dataSource : [AlbumCellViewModelProtocol] { get }
    var didDataLoaded : ((_ error: Errors?)->Void)? { get set }
    func prepareDataSource(with sortOptions : SortOptions)
}
