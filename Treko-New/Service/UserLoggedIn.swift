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

  func userInitializer(post: [Posts]) -> User {

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

    let user: User = User(
      userName: "aryansingh_920", fullName: "Aryan Singh", profilePicture: "profile",
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
    for index in 0...postNumber - 1 {
      feed.append(
        Feed(
          name: user.fullName, location: user.posts[index].location,
          feedImages: user.posts[index].images, profileImage: user.profilePicture,
          numberOfComments: user.posts[index].numberOfComments,
          numberOfLikes: user.posts[index].numberOfLikes, comments: user.posts[index].comments))
    }
    return feed
  }

  init() {
      
      API().Login(username: "aryansingh_20",password: "1234578")

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

    self.userDetails = userInitializer(post: post)
    self.userFeed = feedInitializer(user: self.userDetails, postNumber: post.count)
  }
}
