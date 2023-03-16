//
//  ChattingPage_TableViewCell.swift
//  Treko-New
//
//  Created by Aryan Singh on 16/03/23.
//

import UIKit

class ChattingPage_TableViewCell: UITableViewCell {
    
    @IBOutlet var message: UILabel!
    
    var send:Bool = false
    var recieve:Bool =  false
    
    override func awakeFromNib() {
        super.awakeFromNib()


        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        print(message.text ?? "",send,recieve)
        if(send){
            message.textAlignment = NSTextAlignment.right
        }
        if(recieve){
            message.textAlignment = NSTextAlignment.left
        }
        // Configure the view for the selected state
    }

}
