//
//  ChatPage.swift
//  Treko-New
//
//  Created by Aryan Singh on 10/03/23.
//

import Foundation
struct Chat{
    let username : String
    let imageName : String
    let fullname : String
}
struct Chats{
    var message:String
    var send:Bool
    var recieve:Bool
    init(message: String, send: Bool = false, recieve: Bool = false) {
        self.message = message
        self.send = send
        self.recieve = recieve
        if(self.send == true){
            self.recieve = false
        }
        if(self.recieve == true){
            self.send = false
        }
    }
}
