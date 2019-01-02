//
//  PhotoHeaderCollectionReusableView.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 8/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class PhotoHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var category: PhotoCategory? {
        didSet {
            categoryLabel.text = category?.category
            iconImageView.image = UIImage(named: (category?.icon)!)
        }
    }
        
}
