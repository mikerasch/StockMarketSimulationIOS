//
//  RegisterService.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/29/23.
//

import Foundation

class RegisterService {
    
    func RegisterPost(email: String, username: String, password: String, confirmPassword: String, completion: @escaping (Bool) -> Void) {
        let data = ["email": email, "username": username, "password": password]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            completion(false)
            return
        }
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "register")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(false)
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    completion(true)
                    return
                }
            }
            completion(false)
        }
        task.resume()
    }
}
