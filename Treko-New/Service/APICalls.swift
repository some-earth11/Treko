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
    
    func GET(route:String,completion: @escaping (Data?, Error?) -> Void) {
        // Create URL object
        guard let url = URL(string: "\(urlS)\(route)") else {
            completion(nil, nil)
            return
        }
        
        // Create URL request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create URL session
        let session = URLSession.shared
        
        // Create data task
        let task = session.dataTask(with: request) { (data, response, error) in
            // Check for errors
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // Check for HTTP status code 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, nil)
                return
            }
            
            // Return data
            completion(data, nil)
        }
        
        // Start data task
        task.resume()
    }

    
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
