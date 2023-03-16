//
//  ChatPageViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 12/03/23.
//

import UIKit

class ChatingPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet var table: UITableView!
    @IBOutlet weak var description_profile: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var profile_Image = UIImage()
    var profile_name = ""
    var profile_description = ""
    
    let data:[Chats] = [
    Chats(message: "HelloHelloHelloHelloHelloHelloHelloHelloHelloHello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hi", recieve: true),
    Chats(message: "Hello", send: true),
    Chats(message: "Hi", recieve: true),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = profile_name
        print(data)
        description_profile.text = profile_description
        profileImage.image = profile_Image
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let datas = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChattingPage_TableViewCell
        cell.message.text = datas.message
        cell.send = datas.send
        cell.recieve = datas.recieve
        return cell
        
    }
    
}
