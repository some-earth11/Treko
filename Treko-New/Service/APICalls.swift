//
//  APICalls.swift
//  Treko-New
//
//  Created by Aryan Singh on 29/03/23.
//
import UIKit
import Foundation

struct API {

    let urlS = "https://treko-backend.onrender.com/app"

    
    func POST(parameters:[String:String],route:String,completionHandler: @escaping (Result<[String:String], Error>) -> Void) {
        let url = URL(string: "\(urlS)\(route)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestData = parameters
        let jsonData = try! JSONEncoder().encode(requestData)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completionHandler(.failure(NSError(domain: "com.example.postRequest", code: -1,
                                                    userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode([String:String].self, from: data)
                completionHandler(.success(responseData))
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
