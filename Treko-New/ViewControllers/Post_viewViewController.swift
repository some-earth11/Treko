//
//  Post_viewViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 15/03/23.
//

import UIKit

class Post_viewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    
    let userInstance = logged_in_user()
    var data:[PostViewFeedComment] = []
    @IBOutlet weak var table: UITableView!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var post_image = UIImage()
    var profile_image = UIImage()
    var location_label = ""
    var name_label = ""
    var comments:[PostViewFeedComment] = []
    @IBOutlet var commentInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Post"
        postImage.image = post_image
        profileImage.image = profile_image
        locationLabel.text = location_label
        nameLabel.text = name_label
        data = comments

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell

        cell.imageLabel.image = UIImage(named: datas.userimage)
        cell.label.text = datas.comment
        return cell
    }
    
    @IBAction func addCommentClicked(_ sender: Any) {
        if(commentInput.text! != ""){
            data.append(PostViewFeedComment(userimage: "profile", comment: commentInput.text!))
            table.reloadData()
        }
        
    }
    
    
}
