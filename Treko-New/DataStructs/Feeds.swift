//
//  Feeds.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import Foundation

struct Feed{
    var name:String;
    var location:String;
    var feedImages:[String];
    var profileImage:String;
    var numberOfComments:Int64;
    var numberOfLikes:Int64;
    
    var postDetail = Posts(images: [String], numberOfComments: Int64, numberOfLikes: Int64, location: String);
    var userDetail = User(userName: String, fullName: String, profilePicture: String, profileDescription: String, numberOfPosts: Int64, numberOfFollowers: Int64, numberOfFollowing: Int64);
        init(){
            name = userDetail.userName;
            location = postDetail.location;
            profileImage=userDetail.profilePicture;
            location = postDetail.location;
            feedImages = postDetail.images;
            numberOfLikes = postDetail.numberOfLikes;
            numberOfComments = postDetail.numberOfComments;
        }
}
