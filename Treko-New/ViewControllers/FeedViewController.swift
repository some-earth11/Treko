//
//  FeedViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    let data:[Feed] = [
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain1", profileImage: "profile", numberOfComments: 97, numberOfLikes: 32),
        Feed(name: "Aryan", location: "Nepal", feedImages: "mountain2", profileImage: "profile", numberOfComments: 65, numberOfLikes: 86),
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain3", profileImage: "profile", numberOfComments: 98, numberOfLikes: 42),
        Feed(name: "Aryan", location: "Nepal", feedImages: "mountain4", profileImage: "profile", numberOfComments: 76, numberOfLikes: 21),
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain4", profileImage: "profile", numberOfComments: 54, numberOfLikes: 10)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        table?.dataSource = self

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Post_viewViewController") as? Post_viewViewController
        let datas = data[indexPath.row]
        vc?.name_label = datas.name
        vc?.location_label = datas.location
        vc?.profile_image = UIImage(named: datas.profileImage)!
        vc?.post_image = UIImage(named: datas.feedImages)!
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.noOfLikesLabel.text = String(datas.numberOfLikes)+" Likes"
        cell.noOfCommentsLabel.text = String(datas.numberOfComments)+" Comments"
        cell.postImage.image = UIImage(named: datas.feedImages)
        cell.profileImage.image = UIImage(named: datas.profileImage)
        cell.locationLabel.text = datas.location
        cell.nameLabel.text = datas.name
        return cell
    }
}
