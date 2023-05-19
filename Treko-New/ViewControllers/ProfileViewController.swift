//
//  ProfileViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {

    var numOfElements:CGFloat = 5
    
    var arrDataF = ["image_story","image_story","image_story","image_story","image_story","image_story"]
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var profileDescription: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    let userInstance = logged_in_user()
    
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let loggedInUser = userInstance.userDetails
        
        collectionView.delegate = self
        collectionView.dataSource = self

        postLabel.text = String(loggedInUser!.numberOfPosts)
        followingLabel.text = String(loggedInUser!.numberOfFollowing)
        followersLabel.text = String(loggedInUser!.numberOfFollowers)
        profileImage.image = UIImage(named: loggedInUser!.profilePicture)
        userName.text = loggedInUser!.userName
        fullName.text = loggedInUser!.fullName
        profileDescription.text = loggedInUser!.profileDescription
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDataF.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesFeedCollectionViewCell", for: indexPath) as! StoriesFeedCollectionViewCell
        cell.imagesView.image = UIImage(named: arrDataF[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/numOfElements, height: collectionHeight)
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
