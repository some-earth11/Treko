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
    var posts:[Posts]
}
