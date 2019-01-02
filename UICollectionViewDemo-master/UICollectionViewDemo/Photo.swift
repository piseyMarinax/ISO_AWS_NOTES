//
//  Photo.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 8/11/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation

class PhotoCategory {
    var icon: String?
    var category: String?
    var photos: [String]?
    
    init(icon: String, category: String, photos: [String]) {
        self.icon = icon
        self.category = category
        self.photos = photos
    }
    
    class func downloadPhotos() -> [PhotoCategory] {
        var photoCategories = [PhotoCategory]()
        
        let cat = PhotoCategory(icon: "cat", category: "My Cat", photos: PhotoLibray.generatePhotos(prefix: "cat", numberOfImage: 16))
        let dog = PhotoCategory(icon: "dog", category: "My Dog", photos: PhotoLibray.generatePhotos(prefix: "dog", numberOfImage: 7))
        photoCategories.append(cat)
        photoCategories.append(dog)
        
        return photoCategories
    }
}

class PhotoLibray {
    
    static func generatePhotos(prefix: String, numberOfImage: Int) -> [String] {
        var imageNames = [String]()
        for i in 1...numberOfImage {
            imageNames.append("\(prefix)\(i)")
        }
        return imageNames
    }
    
}
