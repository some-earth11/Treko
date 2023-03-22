//
//  FeedViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    let userInstance = logged_in_user()

    var data:[Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        data = userInstance.userFeed
        table?.dataSource = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "Post_viewViewController") as? Post_viewViewController
            let datas = data[indexPath.row]
            vc?.name_label = datas.name
            vc?.location_label = datas.location
            vc?.profile_image = UIImage(named: datas.profileImage)!
            vc?.post_image = UIImage(named: datas.feedImages)!
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 260
        };return 450
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        if(indexPath.row == 0 ){
            let cell = table.dequeueReusableCell(withIdentifier: "cellTop", for: indexPath) as! FeedTopTableViewCell
            cell.TrekoLabel.text = "Treko"
            return cell
        }else{
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
}
