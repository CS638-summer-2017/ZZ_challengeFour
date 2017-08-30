//
//  login.swift
//  challengeFour
//
//  Created by Lijie Zhao on 8/23/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import Foundation

func login(userText:String, passText:String) {
    let url = URL(string: "http://198.150.10.30:8080/fireside/login")
    var request = URLRequest(url: url!)
    
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let json = """
        {
          "userName": "\(userText)",
          "password": "\(passText)"
        }
    """
    
    let jsonData = json.data(using: .utf8)
    
    request.httpBody = jsonData
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, response, error) in
        
        guard case let createResponse as HTTPURLResponse = response  else {
            print(error!)
            return
        }
        
        guard let status = HTTPStatusCode(rawValue: createResponse.statusCode) else {
            print(error!)
            return
        }
        
        switch status {
        case .created:
            print("Account logged in!")
            
            
            let headers = createResponse.allHeaderFields
            let userToken = headers["user-auth-token"]
            print("user auth token: \(userToken!)")
            
            let defaults = UserDefaults.standard
            defaults.set(userToken, forKey: "user-auth-token")
            //print(defaults.string(forKey: "user-auth-token")!)
         
 
        default:
            print("\(status)")
        }
        
    }
    task.resume()
}
