//
//  PhotoDataSource.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject {
    var photos: [Photo] = []
}

extension PhotoDataSource : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as? PhotoCell{
            cell.configureWithPhoto(photos[indexPath.item])
            return cell
        }
        return collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath)
    }
}
