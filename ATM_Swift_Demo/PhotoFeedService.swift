//
//  PhotoFeedService.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import Foundation

class PhotoFeedService {
    let searchURLString = "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=[TAGS]&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1"
    func fetchPhotoFeed(searchTerm: String?, completion:(photos:[Photo])->()){
        let urlString = searchURLString.stringByReplacingOccurrencesOfString("[TAGS]", withString: searchTerm ?? "rocket")
        
        guard let url = NSURL(string: urlString) else{
            completion(photos: []);
            return
        }
        
        let task = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithURL(url){
            (data:NSData?, response: NSURLResponse?, error:NSError?) in
            
            guard let d = data else{
                completion(photos: []);
                return
            }
            
            if let json = try? NSJSONSerialization.JSONObjectWithData(d, options: []) as? NSDictionary{
                if let photosDictionary = json!["photos"] as? NSDictionary{
                    if let photoDictionaryArray = photosDictionary["photo"] as? Array<Dictionary<String, AnyObject>> {
                        let photoArray = photoDictionaryArray.map(){
                            Photo(dictionary:$0)
                        }
                        completion(photos: photoArray)
                    }
                }
            }
        }
        task.resume()
    }
}