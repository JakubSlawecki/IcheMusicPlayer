//
//  CollectionViewCell.swift
//  IcheMusicPlayer
//
//  Created by Jakub Slawecki on 02/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var song: Song? {
        didSet {
           self.reloadData()
        }
    }
    
//    var songTitle : String? {
//        didSet {
//            self.reloadData()
//        }
//    }
//
//    var artist : String? {
//        didSet {
//            self.reloadData()
//        }
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .black
        
    }
    
    func reloadData() {
        self.songTitleLabel.text = self.song?.songTitle
        self.artistLabel.text = self.song?.artist
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

struct Song {
    var songTitle : String = "Song title default"
    var artist : String = "Default Artist"
    
    init(songTitle: String, artist: String) {
        self.songTitle = songTitle
        self.artist = artist
    }
}
