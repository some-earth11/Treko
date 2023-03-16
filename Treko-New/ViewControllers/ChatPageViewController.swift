//
//  TableViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 10/03/23.
//

import UIKit

class ChatPageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table:UITableView!
    
    let data:[Chat] = [
        Chat(username: "aryansingh_920", imageName: "profile", fullname: "Aryan Singh"),
        Chat(username: "singh_920", imageName: "profile", fullname: "Aryan"),
        Chat(username: "aryansingh_920", imageName: "profile", fullname: "Aryan Singh"),
        Chat(username: "singh_920", imageName: "profile", fullname: "Aryan"),
        Chat(username: "aryansingh_920", imageName: "profile", fullname: "Aryan Singh"),
        Chat(username: "singh_920", imageName: "profile", fullname: "Aryan"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title="Chat"
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatingPageViewController") as? ChatingPageViewController
        let datas = data[indexPath.row]
        vc?.profile_name = datas.username
        vc?.profile_Image = UIImage(named: datas.imageName)!
        vc?.profile_description = datas.fullname
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
        cell.nameView.text = datas.username
        cell.chatView.text = datas.fullname
        cell.iconImageView.image = UIImage(named: datas.imageName)
        return cell
    }

}
