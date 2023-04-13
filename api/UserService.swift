//
//  UserService.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/13/23.
//

import Foundation

class UserService {
    
    func getBalance(completion: @escaping (Bool) -> Void) {
        let user = User.instance
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "user/balance")!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(false)
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    if let jsonData = data {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                                if let balance = json["Body"] as? String {
                                    user.setBalance(balance: balance)
                                    completion(true)
                                    return
                                }
                            }
                        } catch {
                            print("Error parsing JSON: \(error)")
                        }
                    }
                }
            }
            completion(false)
        }
        task.resume()
    }
    
    func getStockPrice(ticker: String, completion: @escaping (_ success: Bool, _ price: String?) -> Void) {
        let user = User.instance
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "stocks/ticker")!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        request.setValue(ticker, forHTTPHeaderField: "ticker")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(false,"")
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    if let jsonData = data {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                                print(json)
                                if let stockPrice = json["05. price"] as? String {
                                    completion(true,stockPrice)
                                    return
                                }
                            }
                        } catch {
                            print("Error parsing JSON: \(error)")
                        }
                    }
                }
            }
            completion(false,"")
        }
        task.resume()
    }
}
