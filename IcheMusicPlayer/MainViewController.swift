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
    
    var items : [String] = ["StickyHeaderFlowLayout basic example", "Example to initialize in code", "Please Enjoy", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var layout = StickyHeaderFlowLayout()
    
    
//    private var layout : StickyHeaderFlowLayout? {
//        return collectionView?.collectionViewLayout as? StickyHeaderFlowLayout
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.alwaysBounceVertical = true
        view.backgroundColor = .white
        
        // Setup Cell.
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        layout.itemSize = CGSize(width: view.frame.size.width, height: 44)
        
        // Setup Header.
        collectionView.register(CollectionParallaxHeader.self, forSupplementaryViewOfKind: StickyHeaderFlowLayout.parallaxHeaderIdentifier, withReuseIdentifier: "CollectionParallaxHeader")
        layout.parallaxHeaderReferenceSize = CGSize(width: self.view.frame.size.width, height: 200)
        layout.parallaxHeaderMinimumReferenceSize = CGSize(width: self.view.frame.size.width, height: 160)
        
        // Setup Section Header.
        let collectionViewSectionHeaderNib = UINib(nibName: "CollectionViewSectionHeader", bundle: nil)
        collectionView.register(collectionViewSectionHeaderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewSectionHeader")
        //collectionView.register(CollectionViewSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewSectionHeader")
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 80)
    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.text = self.items[indexPath.row]
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

