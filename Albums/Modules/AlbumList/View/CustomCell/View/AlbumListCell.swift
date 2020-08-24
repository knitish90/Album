//
//  AlbumListCell.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import UIKit

class AlbumListCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var collectionPriceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(cellModel : AlbumCellViewModelProtocol) {
        addAccessibilityIdentifier()
        artistNameLabel.text    =   cellModel.artistName
        profileImageView.setImage(with: cellModel.artworkUrl)
        trackNameLabel.text =   "Track Name: \(cellModel.trackCensoredName)"
        collectionNameLabel.text    =   "CollectionName : \(cellModel.collectionName ?? "")"
        collectionPriceLabel.text   =   "Price: \(String(cellModel.collectionPrice))"
        releaseDateLabel.text   =   "Release Date: \(cellModel.releaseDate.toString())"
        
    }

    
    func addAccessibilityIdentifier() {
        artistNameLabel.accessibilityIdentifier = "artistNameLabel"
        trackNameLabel.accessibilityIdentifier  =   "trackNameLabel"
        collectionNameLabel.accessibilityIdentifier =   "collectionNameLabel"
        collectionPriceLabel.accessibilityIdentifier    =   "collectionPriceLabel"
        profileImageView.accessibilityIdentifier  = "profileImageView"
    }
}
