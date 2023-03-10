//
//  TableViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 10/03/23.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var table:UITableView!
    
    let data:[Chat] = [
        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),
        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),
        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),
        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),        Chat(name: "Aryan", imageName: "profile", chat: "Lorem Ipsum"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
        cell.nameView.text = datas.name
        cell.chatView.text = datas.chat
        cell.iconImageView.image = UIImage(named: datas.imageName)
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
