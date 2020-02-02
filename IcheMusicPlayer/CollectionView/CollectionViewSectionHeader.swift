//
//  CollectionViewSectionHeader.swift
//  IcheMusicPlayer
//
//  Created by Jakub Slawecki on 02/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import UIKit

class CollectionViewSectionHeader: UICollectionReusableView {
    
   // let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        //self.addSubview(label)
//        label.frame = self.bounds
//        label.text = UICollectionView.elementKindSectionHeader
    }
    
}
