//
//  PhotCellCollectionViewCell.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var photo: Photo?
    
    override func prepareForReuse() {
        self.photo = nil
        self.imageView.image = nil
        self.titleLabel.text = nil
    }
    
    func configureWithPhoto(photo: Photo){
        self.photo = photo
        titleLabel.text = photo.title
        PhotoImageService.sharedInstance.fetchPhotoForURL(photo.url){
            (image, url) in
            if self.photo?.url == url {
                dispatch_async(dispatch_get_main_queue(), {
                    self.imageView.image = image
                })
            }
        }
    }
}
