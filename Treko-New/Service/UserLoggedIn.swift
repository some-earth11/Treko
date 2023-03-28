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
  var userChats: [Chats]!

  func userInitializer(post: [Posts]) -> User {

    let arrDataF = [
      storiesView(imageName: "uploadPlus", imageTitle: "upload"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
      storiesView(imageName: "image_story", imageTitle: "story"),
    ]

    let user: User = User(
      userName: "aryansingh_920", fullName: "Aryan Singh", profilePicture: "profile",
      profileDescription: "Trekker", numberOfPosts: 23, numberOfFollowers: 604,
      numberOfFollowing: 19, posts: post, stories: arrDataF)
    return user
  }

  func feedInitializer(user: User, postNumber: Int) -> [Feed] {
    let feedBase: Feed = Feed(
      name: "", location: "", feedImages: "", profileImage: "", numberOfComments: 0,
      numberOfLikes: 0)
    var feed: [Feed] = []  // default feed array for top value
    feed.append(feedBase)
    feed.append(feedBase)
    for index in 0...postNumber - 1 {
      feed.append(
        Feed(
          name: user.fullName, location: user.posts[index].location,
          feedImages: user.posts[index].images, profileImage: user.profilePicture,
          numberOfComments: user.posts[index].numberOfComments,
          numberOfLikes: user.posts[index].numberOfLikes))
    }
    return feed
  }

  func chatInitializer(user: User) -> [Chats] {
    let chats: [Chats] = [
      Chats(
        message: "Hello", recieve: true,
        sender: sendRecvDetail(userName: user.userName, fullName: user.fullName),
        reciever: sendRecvDetail(userName: "some username", fullName: "some name"))
    ]
    return chats
  }

  init() {
    let post: [Posts] = [
      Posts(images: "mountain1", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain2", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain3", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain4", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain1", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain2", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain3", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
      Posts(images: "mountain4", numberOfComments: 97, numberOfLikes: 32, location: "Nepal"),
    ]

    self.userDetails = userInitializer(post: post)
    self.userFeed = feedInitializer(user: self.userDetails, postNumber: post.count)
    self.userChats = chatInitializer(user: self.userDetails)
  }
}
