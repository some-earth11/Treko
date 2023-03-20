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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if(send){
            message.textAlignment = NSTextAlignment.right
//            message.backgroundColor = UIColor.blue
        }
        if(recieve){
            message.textAlignment = NSTextAlignment.left
//            message.backgroundColor = UIColor.green
        }

    }

}
