//
//  User.swift
//  Treko-New
//
//  Created by Aryan Singh on 20/03/23.
//

import Foundation

struct logged_in_user {
    
    

  var userDetails: User!
  var userFeed: [Feed]!

    func userInitializer(user:String,post: [Posts]) -> User {

    let arrDataF = [
      storiesView(imageName: "uploadPlus", imageTitle: "upload"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
    ]

    let chatData: [String: Chat] = [
      "abc_12": Chat(
        username_send: "abc_12", imageName: "profile", fullname: "ABC12",
        chatMessages: [
          Chats(
            message: "Hello", recieve: true),
          Chats(
            message: "Hi", send: true
          ),
        ]),
      "xyxyilio": Chat(
        username_send: "xyxyilio", imageName: "profile", fullname: "xyxyilioxyxyilio",
        chatMessages: [
          Chats(
            message: "Hi", send: true
          )
        ]),
    ]
        
        API().GET(route: "/profile?username=\(user)"){
            result in
            switch result {
            case .success(let response):
                print("respomnse",response)
            case .failure(let error):
                print("Error User fetching JSON data: \(error.localizedDescription)")
            }
        }

    let user: User = User(
      userName: user, fullName: "Aryan Singh", profilePicture: "profile",
      profileDescription: "Trekker", numberOfPosts: 23, numberOfFollowers: 604,
      numberOfFollowing: 19, posts: post, stories: arrDataF, chats: chatData)
    return user
  }

  func feedInitializer(user: User, postNumber: Int) -> [Feed] {
    let feedBase: Feed = Feed(
      name: "", location: "", feedImages: "", profileImage: "", numberOfComments: 0,
      numberOfLikes: 0, comments:  [PostViewFeedComment(userimage: "", comment: "")])
      var feed: [Feed] = []  // default feed array for top value
    feed.append(feedBase)
    feed.append(feedBase)
      API().GET(route: "/getFeed"){ result in
          switch result {
          case .success(let response):
              let resp = (response["msg"]  as! [[String:Any]])
              for i in resp{
                  let user:[String:Any] = i["user"] as! [String : Any]
                  let name = "\(user["firstName"] as! String) \(user["lastName"] as! String)"
                  let location = i["location"] as! String
                  let img = i["images"] as! String
    //                    let profileImage = user["profilePicture"]!
                  let nol =  i["numberOfLikes"] as! Int
                  let noc = i["numberOfComments"] as! Int
                  let comments = i["comments"] as! Array<Any>
                  let feedI = Feed(name: name, location: location, feedImages: "mountain1", profileImage: "profile", numberOfComments: Int64(noc), numberOfLikes: Int64(nol), comments: [ PostViewFeedComment(userimage: "profile", comment: "Awesome"),])
                  feed.append(feedI)

              }
              print("after loop feedI",feed)
          case .failure(let error):
              print("Error fetching JSON data: \(error.localizedDescription)")
              for index in 0...postNumber - 1 {
                feed.append(
                  Feed(
                    name: user.fullName, location: user.posts[index].location,
                    feedImages: user.posts[index].images, profileImage: user.profilePicture,
                    numberOfComments: user.posts[index].numberOfComments,
                    numberOfLikes: user.posts[index].numberOfLikes, comments: user.posts[index].comments))
              }
          }
      }
//      print("feedHere",feed)
    return feed
  }
    
    

  init() {
      
      let defaults = UserDefaults.standard
      
      
    let post: [Posts] = [
      Posts(
        images: "mountain1", numberOfComments: 97, numberOfLikes: 32, location: "Nepal",
        comments:[
          PostViewFeedComment(userimage: "profile", comment: "Awesome")
        ]),
      Posts(
        images: "mountain2", numberOfComments: 97, numberOfLikes: 32, location: "Nepal",
        comments: [
          PostViewFeedComment(userimage: "profile", comment: "Awesome"),
          PostViewFeedComment(userimage: "profile", comment: "Awesome"),
        ]),
      Posts(
        images: "mountain3", numberOfComments: 97, numberOfLikes: 32, location: "Nepal",
        comments: [
          PostViewFeedComment(userimage: "profile", comment: "Awesome")
        ]),
      Posts(
        images: "mountain4", numberOfComments: 97, numberOfLikes: 32, location: "Nepal",
        comments: [
          PostViewFeedComment(userimage: "profile", comment: "Awesome"),
          PostViewFeedComment(userimage: "profile", comment: "Awesome"),
        ]),
    ]

      if(defaults.string(forKey: "user") != ""){
        self.userDetails = userInitializer(user:
                                                defaults.string(forKey: "user")!,post: post)
        self.userFeed = feedInitializer(user: self.userDetails, postNumber: post.count)}
      

  }
}
