//
//  Posts.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import Foundation

struct Posts{
    var images:[String];
    var numberOfComments:Int64;
    var numberOfLikes:Int64;
    var location:String;
    init(images: [String], numberOfComments: Int64, numberOfLikes: Int64, location: String) {
        self.images = images
        self.numberOfComments = numberOfComments
        self.numberOfLikes = numberOfLikes
        self.location = location
    }
    
}
