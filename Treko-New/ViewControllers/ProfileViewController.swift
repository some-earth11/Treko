//
//  ProfileViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var profileDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let loggedInUser = User(userName: "aryansingh_920", fullName: "Aryan Singh", profilePicture: "profile", profileDescription: "Trekker", numberOfPosts: 45, numberOfFollowers: 100, numberOfFollowing: 498)

        
        postLabel.text = String(loggedInUser.numberOfPosts)
        followingLabel.text = String(loggedInUser.numberOfFollowing)
        followersLabel.text = String(loggedInUser.numberOfFollowers)
        profileImage.image = UIImage(named: loggedInUser.profilePicture)
        userName.text = loggedInUser.userName
        fullName.text = loggedInUser.fullName
        profileDescription.text = loggedInUser.profileDescription
    }
    
}
