//
//  Photo.swift
//  ATM_Swift_Demo
//
//  Created by Oleksandr Sofishchenko on 4/2/16.
//  Copyright © 2016 Oleksandr Sofishchenko. All rights reserved.
//

import Foundation

class Photo {
    var farm: Int?
    var identifier: String?
    var server: String?
    var secret: String?
    var title: String?
    
    init(dictionary:Dictionary<String,AnyObject>){
        self.configureWithDictionary(dictionary)
    }
    
    func configureWithDictionary(dictionary: Dictionary<String,AnyObject>){
        if let farm = dictionary["farm"] as? Int{
            self.farm = farm
        }
        if let identifier = dictionary["id"] as? String{
            self.identifier = identifier
        }
        if let server = dictionary["server"] as? String{
            self.server = server
        }
        if let secret = dictionary["secret"] as? String{
            self.secret = secret
        }
        if let title = dictionary["title"] as? String{
            self.title = title
        }
    }
    
    var url: NSURL{
        get{
            let baseURLString = "http://farm[FARM].static.flickr.com/[SERVER]/[ID]_[SECRET]_m.jpg"
            if farm != nil && server != nil && identifier != nil && secret != nil {
                var urlString = baseURLString.stringByReplacingOccurrencesOfString("[FARM]", withString: "\(farm!)")
                urlString = urlString.stringByReplacingOccurrencesOfString("[SERVER]", withString: server!)
                urlString = urlString.stringByReplacingOccurrencesOfString("[ID]", withString: identifier!)
                urlString = urlString.stringByReplacingOccurrencesOfString("[SECRET]", withString: secret!)
                return NSURL(string: urlString) ?? NSURL()
            }
            return NSURL()
        }
    }
}