//
//  PhotoCollectionViewCell.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 8/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageName: String? {
        didSet {
            self.photoImageView.image = UIImage(named: imageName!)
        }
    }
    
}
