//
//  User.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import Foundation

struct User{
    var userName:String;
    var fullName:String;
    var profilePicture:String;
    var profileDescription:String;
    var numberOfPosts:Int64;
    var numberOfFollowers:Int64;
    var numberOfFollowing:Int64;
    
    var posts = [Posts(images: [String], numberOfComments: Int64, numberOfLikes: Int64, location: String)];
    var stories = [Story(image: String, storyTitle: String)];
    
    init(userName: String, fullName: String, profilePicture: String, profileDescription: String, numberOfPosts: Int64, numberOfFollowers: Int64, numberOfFollowing: Int64) {
        self.userName = userName
        self.fullName = fullName
        self.profilePicture = profilePicture
        self.profileDescription = profileDescription
        self.numberOfPosts = numberOfPosts
        self.numberOfFollowers = numberOfFollowers
        self.numberOfFollowing = numberOfFollowing
    }
}

