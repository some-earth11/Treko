//
//  Post_viewViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 15/03/23.
//

import UIKit

class Post_viewViewController: UIViewController {

    @IBOutlet var postImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var post_image = UIImage()
    var profile_image = UIImage()
    var location_label = ""
    var name_label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Post"
        postImage.image = post_image
        profileImage.image = profile_image
        locationLabel.text = location_label
        nameLabel.text = name_label
    }
}
