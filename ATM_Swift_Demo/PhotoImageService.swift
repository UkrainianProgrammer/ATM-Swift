//
//  PhotoImageService.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import Foundation

import UIKit

class PhotoImageService {
    static let sharedInstance = PhotoImageService()
    
    let cache = NSCache()
    
    func fetchPhotoForURL(url: NSURL, completion:((image: UIImage?, url: NSURL)->())){
        if let image = cache.objectForKey(url) as? UIImage {
            completion(image: image, url: url)
            return
        }
        let task = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithURL(url) {
            (data:NSData?, response: NSURLResponse?, error:NSError?) in
            
            if let d = data {
                if let jpeg = UIImage(data: d) {
                    self.cache.setObject(jpeg, forKey: url)
                    completion(image: jpeg, url: url)
                } else{
                    completion(image: nil, url: url)
                }
            } else{
                completion(image: nil, url: url)
            }
            
        }
        task.resume()
    }
}