//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 8/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photoCategories = PhotoCategory.downloadPhotos()
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = photoCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let leftAndRightPadding:CGFloat = 2
        let numberOfItemsPerRow:CGFloat = 4
        let itemWidth = (self.view.bounds.size.width - leftAndRightPadding) / numberOfItemsPerRow
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (photoCategories[section].photos?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        cell.imageName = photoCategories[indexPath.section].photos?[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photoHeader", for: indexPath) as! PhotoHeaderCollectionReusableView
        
        header.category = photoCategories[indexPath.section]
        
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}

