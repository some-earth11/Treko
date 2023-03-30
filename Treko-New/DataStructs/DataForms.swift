//
//  DataForms.swift
//  Treko-New
//
//  Created by Aryan Singh on 28/03/23.
//

import Foundation
import UIKit


//Feed
struct Feed{
    var name:String;
    var location:String;
    var feedImages:String;
    var profileImage:String;
    var numberOfComments:Int64;
    var numberOfLikes:Int64;
    var comments:[PostViewFeedComment]
}


//Chat
struct Chat{
    let username_send : String
    let imageName : String
    let fullname : String
    let chatMessages : [Chats]
    
}


struct sendRecvDetail
{
    var userName:String
    var fullName:String
}


struct Chats{
    var message:String
    var send:Bool
    var recieve:Bool

    init(message: String,
         send: Bool = false,
         recieve: Bool = false) {
        
        self.message = message
        
        self.send = send
        self.recieve = recieve
        
        if(self.send == true){
            self.recieve = false
        }
        if(self.recieve == true){
            self.send = false
        }
    }
}


//PostViewFeed
struct PostViewFeedComment{
    var userimage:String
    var comment:String
}


//Posts
struct Posts{
    var images:String;
    var numberOfComments:Int64;
    var numberOfLikes:Int64;
    var location:String;
    var comments:[PostViewFeedComment]
}

//On Boarding Screen
struct OnboardingSlide{
    let title, description: String
    let image: UIImage
}

//Stories
struct storiesView{
    let imageName:String
    let imageTitle:String
}

//User
struct User{
    var userName:String;
    var fullName:String;
    var profilePicture:String;
    var profileDescription:String;
    var numberOfPosts:Int64;
    var numberOfFollowers:Int64;
    var numberOfFollowing:Int64;
    var posts:[Posts]
    var stories:[storiesView]
    var chats:[String:Chat]
}

//Trek
struct Trek{
    var TrekName: String
    var image: UIImage
}
