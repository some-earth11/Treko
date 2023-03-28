//
//  TableViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 10/03/23.
//

import UIKit

class ChatPageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table:UITableView!
    
    let userInstance = logged_in_user()

    var data:[Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Chat"
        data = Array(userInstance.userDetails.chats.values)
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatingPageViewController") as? ChatingPageViewController
        let datas = data[indexPath.row]
        vc?.profile_name = datas.username_send
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
        cell.nameView.text = datas.username_send
        cell.chatView.text = datas.fullname
        cell.iconImageView.image = UIImage(named: datas.imageName)
        return cell
    }

}
