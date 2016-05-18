//
//  ViewController.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = photoDataSource
        PhotoFeedService().fetchPhotoFeed("rocket") {
            (photos) in self.photoDataSource.photos = photos
            dispatch_async(dispatch_get_main_queue(), {
                self.collectionView.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

