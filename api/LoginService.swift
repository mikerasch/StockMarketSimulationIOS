//
//  LoginService.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/29/23.
//

import Foundation

class LoginService {
    // because async call, you should use completion
    func loginPost(username: String, password: String, completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "login")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(username, forHTTPHeaderField: "username")
        request.setValue(password, forHTTPHeaderField: "password")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(false)
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    // todo add information of body to a user class
                    completion(true)
                    return
                }
            }
            completion(false)
        }
        task.resume()
    }

}
