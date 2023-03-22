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


struct sendRecvDetail
{
    var userName:String
    var fullName:String
}


struct Chats{
    var message:String
    var send:Bool
    var recieve:Bool
    var sender:sendRecvDetail
    var reciever:sendRecvDetail

    init(message: String,
         send: Bool = false,
         recieve: Bool = false,
         sender:sendRecvDetail=sendRecvDetail(userName: "", fullName: ""),
         reciever:sendRecvDetail=sendRecvDetail(userName: "", fullName: "")) {
        
        self.message = message
        
        self.send = send
        self.sender = sender
        
        self.reciever = reciever
        self.recieve = recieve
        
        if(self.send == true){
            self.recieve = false
        }
        if(self.recieve == true){
            self.send = false
        }
    }
}
