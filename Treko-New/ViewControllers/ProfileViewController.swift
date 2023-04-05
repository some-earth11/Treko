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
    
    let userInstance = logged_in_user()
    
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let loggedInUser = userInstance.userDetails

        postLabel.text = String(loggedInUser!.numberOfPosts)
        followingLabel.text = String(loggedInUser!.numberOfFollowing)
        followersLabel.text = String(loggedInUser!.numberOfFollowers)
        profileImage.image = UIImage(named: loggedInUser!.profilePicture)
        userName.text = loggedInUser!.userName
        fullName.text = loggedInUser!.fullName
        profileDescription.text = loggedInUser!.profileDescription
    }
    
    
    @IBAction func logOutClicked(_ sender: Any) {
        defaults.set("",forKey: "user")
        self.handleLogout()
    }
    func handleLogout(){
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") 
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }

    }
    
}
