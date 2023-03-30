//
//  APICalls.swift
//  Treko-New
//
//  Created by Aryan Singh on 29/03/23.
//
import UIKit
import Foundation

struct API {
    
//    let urlS = "https://ff3c-2401-4900-1cd4-aa34-d83c-de52-e12-4d0e.in.ngrok.io/app"
    let urlS = "localhost:8888/app"
//    let defaults = UserDefaults.standard


    func Login(username:String, password:String) {
        let parameters = [ "Username" :username,
                           "password": password ]

        POST (parameters: parameters, route: "/login", completion: { data in
            print("Request success ")
        })
    }

    func POST(parameters:[AnyHashable:Any],route:String,  completion: @escaping (String?)->()){
        let url = URL(string: urlS+route)!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        // create the session
        let session = URLSession.shared
        // create the data task
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            // handle the response
            if let error = error {
                print("Error: (error)")
                completion(nil)
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                print("Invalid response")
                completion(nil)
                return
            }

            print(data)

            if response.statusCode == 200 {
                // handle successful response
//                defaults.set(true, forKey: "loggedIn")
                print("Success")
                //convert data to string
                var str = String(data: data, encoding: .utf8)
                print("\(str)")
//                performSegue(withIdentifier: "LoggedinSuccess", sender: self)
                return
            } else {
                // handle error response
                print("Error: \(response.statusCode)")
                return
            }
        }
        // start the task
        task.resume()
    }
}
