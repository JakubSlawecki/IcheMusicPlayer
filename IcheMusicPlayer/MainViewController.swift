//
//  ViewController.swift
//  IcheMusicPlayer
//
//  Created by Jakub Slawecki on 01/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items : [String] = ["Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song", "Song"]
    
    let song1 = Song(songTitle: "Jumpsuit", artist: "Twenty One Pilots")
    let song2  = Song(songTitle: "Levitate", artist: "Twenty One Pilots")
    let song3  = Song(songTitle: "Morph", artist: "Twenty One Pilots")
    let song4  = Song(songTitle: "My Blood", artist: "Twenty One Pilots")
    let song5  = Song(songTitle: "Chlorine", artist: "Twenty One Pilots")
    let song6  = Song(songTitle: "Smithereens", artist: "Twenty One Pilots")
    let song7  = Song(songTitle: "Neon Gravestones", artist: "Twenty One Pilots")
    let song8  = Song(songTitle: "The Hype", artist: "Twenty One Pilots")
    let song9  = Song(songTitle: "Nico and the Niners", artist: "Twenty One Pilots")
    let song10 = Song(songTitle: "Cut My Lip", artist: "Twenty One Pilots")
    let song11 = Song(songTitle: "Bandito", artist: "Twenty One Pilots")
    let song12 = Song(songTitle: "Pet Cheetah", artist: "Twenty One Pilots")
    let song13 = Song(songTitle: "Legend", artist: "Twenty One Pilots")
    let song14 = Song(songTitle: "Leave The City", artist: "Twenty One Pilots")
    
    var album : [Song] = []
    
    var layout = StickyHeaderFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        album.append(song1)
        album.append(song2)
        album.append(song3)
        album.append(song4)
        album.append(song5)
        album.append(song6)
        album.append(song7)
        album.append(song8)
        album.append(song9)
        album.append(song10)
        album.append(song11)
        album.append(song12)
        album.append(song13)
        album.append(song14)
    
        
        
        
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.alwaysBounceVertical = true
        view.backgroundColor = .white
        
        // Setup Cell.
        let collectionViewCellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "CollectionViewCell")
        layout.itemSize = CGSize(width: view.frame.size.width, height: 63)
        
        // Setup Header.
        let collectionParallaxHeaderNib = UINib(nibName: "CollectionParallaxHeader", bundle: nil)
        collectionView.register(collectionParallaxHeaderNib, forSupplementaryViewOfKind: StickyHeaderFlowLayout.parallaxHeaderIdentifier, withReuseIdentifier: "CollectionParallaxHeader")
        layout.parallaxHeaderReferenceSize = CGSize(width: self.view.frame.size.width, height: 350)
        layout.parallaxHeaderMinimumReferenceSize = CGSize(width: self.view.frame.size.width, height: 0)
        
        // Setup Section Header.
        let collectionViewSectionHeaderNib = UINib(nibName: "CollectionViewSectionHeader", bundle: nil)
        collectionView.register(collectionViewSectionHeaderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewSectionHeader")
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 80)
    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.album.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.song = self.album[indexPath.row]
        return cell
    }
    
    // Parallax Header.
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == StickyHeaderFlowLayout.parallaxHeaderIdentifier {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionParallaxHeader", for: indexPath)
            return view
        } else if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewSectionHeader", for: indexPath)
            //view.backgroundColor = .lightGray
            return view
        }

        return UICollectionReusableView()
    }
    
    

    
    
}

