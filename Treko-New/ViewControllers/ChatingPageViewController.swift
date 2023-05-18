//
//  ChatPageViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 12/03/23.
//

import UIKit
import StoreKit
class ChatingPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, SKStoreProductViewControllerDelegate {

    @IBOutlet var table: UITableView!
    @IBOutlet weak var description_profile: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var messageTextField: UITextField!
    
    var profile_Image = UIImage()
    var profile_name = ""
    var profile_description = ""
    
    let userInstance = logged_in_user()
    
    var data:[Chats] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = profile_name

        data = userInstance.userDetails.chats[profile_name]!.chatMessages
        description_profile.text = profile_description
        profileImage.image = profile_Image
    }
    
    
    @IBAction func phoneTapped(_ sender: Any) {
         let phoneNumber = "1234567890" // Replace with the desired phone number
         
         let storeViewController = SKStoreProductViewController()
         storeViewController.delegate = self
         
         let parameters: [String: Any] = [
             SKStoreProductParameterITunesItemIdentifier: phoneNumber
         ]
         
         storeViewController.loadProduct(withParameters: parameters) { [weak self] (_, error) in
             if let error = error {
                 print("Failed to load product view controller: \(error.localizedDescription)")
                 return
             }
             
             DispatchQueue.main.async {
                 self?.present(storeViewController, animated: true, completion: nil)
             }
         }
     }
    
    
    @IBAction func sendBtnClicked(_ sender: UIButton) {
        if(messageTextField.text != ""){
            data.append(Chats(message: messageTextField.text!,send: true))
        }
        messageTextField.text = ""

        table.reloadData()
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
