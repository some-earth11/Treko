//
//  FeedViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    let data:[Feed] = [
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain1", profileImage: "profile", numberOfComments: 104, numberOfLikes: 521),
        Feed(name: "Aryan", location: "Nepal", feedImages: "mountain2", profileImage: "profile", numberOfComments: 104, numberOfLikes: 521),
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain3", profileImage: "profile", numberOfComments: 104, numberOfLikes: 521),
        Feed(name: "Aryan", location: "Nepal", feedImages: "mountain4", profileImage: "profile", numberOfComments: 104, numberOfLikes: 521),
        Feed(name: "Aryan Singh", location: "Nepal", feedImages: "mountain4", profileImage: "profile", numberOfComments: 104, numberOfLikes: 521)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Feed"
        table?.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.noOfLikesLabel.text = String(datas.numberOfLikes)
        cell.noOfCommentsLabel.text = String(datas.numberOfComments)
        cell.postImage.image = UIImage(named: datas.feedImages)
        cell.profileImage.image = UIImage(named: datas.profileImage)
        cell.locationLabel.text = datas.location
        cell.nameLabel.text = datas.name
        return cell
    }
}
