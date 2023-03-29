//
//  APICalls.swift
//  Treko-New
//
//  Created by Aryan Singh on 29/03/23.
//

import Foundation

struct API{
    let urlS = "https://ff3c-2401-4900-1cd4-aa34-d83c-de52-e12-4d0e.in.ngrok.io/app"
    let defaults = UserDefaults.standard
    
    func Login(username:String,password:String) {
        //        print(username,password)
        let url = URL(string: urlS+"/login")!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = [
            "username":username,
            "password":password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        // create the session
        let session = URLSession.shared
        
        // create the data task
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            // handle the response
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            print(data)
            
            if response.statusCode == 200 {
                // handle successful response
                defaults.set(true, forKey: "loggedIn")
                print("Success")
                return
            } else {
                // handle error response
                print("Error: \(response.statusCode)")
            }
        }
        // start the task
        task.resume()
    }
}
