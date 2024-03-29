//
//  FeedViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/03/23.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    var data:[Feed] = []
    
    let apiCall = API()
    
    var defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        let userInstance = logged_in_user()
        
        title = "Feed"
        
        DispatchQueue.main.async {
            self.APICall()
            self.table.reloadData()
        }
        
        print("Data",data)
        super.viewDidLoad()

        
//        data = userInstance.userFeed
        table?.dataSource = self
        
        print("User",defaults.string(forKey: "user")!)
        
    }
    
    func APICall(){
        let feedBase: Feed = Feed(
          name: "", location: "", feedImages: "", profileImage: "", numberOfComments: 0,
          numberOfLikes: 0, comments:  [PostViewFeedComment(userimage: "", comment: "")])
//          var data: [Feed] = []  // default feed array for top value
        self.data.append(feedBase)
        self.data.append(feedBase)
        
//        DispatchQueue.main.async {
            API().GET(route: "/getFeed"){ result in
                switch result {
                case .success(let response):
                    let resp = (response["msg"]  as! [[String:Any]])
                    for i in resp{
                        let user:[String:Any] = i["user"] as! [String : Any]
                        let name = "\(user["firstName"] as! String) \(user["lastName"] as! String)"
                        let location = i["location"] as! String
                        let img = i["images"] as! String
                        let nol =  i["numberOfLikes"] as! Int
                        let noc = i["numberOfComments"] as! Int
                        let comments = i["comments"] as! Array<Any>
                        let feedI = Feed(name: name, location: location, feedImages: "mountain1", profileImage: "profile", numberOfComments: Int64(noc), numberOfLikes: Int64(nol), comments: [ PostViewFeedComment(userimage: "profile", comment: "Awesome"),])
                        self.data.append(feedI)
                        
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }


                    }

                case .failure(let error):
                    print("Error fetching JSON data: \(error.localizedDescription)")
                }
            }
//        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.row){
        case 0...1:
            print("First Two cells Selected")
            break;
        default:
            let vc = storyboard?.instantiateViewController(withIdentifier: "Post_viewViewController") as? Post_viewViewController
            let datas = data[indexPath.row]
            vc?.name_label = datas.name
            vc?.location_label = datas.location
            vc?.profile_image = UIImage(named: datas.profileImage)!
            vc?.post_image = UIImage(named: datas.feedImages)!
            vc?.comments = datas.comments
            self.navigationController?.pushViewController(vc!, animated: true)
            break;
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return 50
        case 1:
            return 180
        default:
            return 450;
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        switch(indexPath.row){
        case 0:
            let cell = table.dequeueReusableCell(withIdentifier: "cellTop", for: indexPath) as! FeedTopTableViewCell
            cell.TrekoLabel.text = "Treko"
            cell.layer.shadowOffset = CGSizeMake(0, 0)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.23
            cell.layer.shadowRadius = 4
            cell.isSelected = true
            return cell
        case 1:
            let cell = table.dequeueReusableCell(withIdentifier: "cellStory", for: indexPath) as! StoriesFeedTableViewCell
            cell.collectionView.tag = indexPath.section
            let stories = logged_in_user().userDetails.stories
            cell.arrDataF = stories
            
            DispatchQueue.main.async {
                cell.layer.shadowOffset = CGSizeMake(0, 0)
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOpacity = 0.23
                cell.layer.shadowRadius = 4
                cell.isSelected = true
            }
            
            return cell
        default:
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
            cell.noOfLikesLabel.text = String(datas.numberOfLikes)+" Likes"
            cell.noOfCommentsLabel.text = String(datas.numberOfComments)+" Comments"
            cell.postImage.image = UIImage(named: datas.feedImages)
            cell.profileImage.image = UIImage(named: datas.profileImage)
            cell.locationLabel.text = datas.location
            cell.nameLabel.text = datas.name
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.3
            cell.isSelected = true
            return cell
        }
    }
}
