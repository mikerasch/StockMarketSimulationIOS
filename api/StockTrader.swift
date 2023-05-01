//
//  StockTrader.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/20/23.
//

import Foundation

@MainActor
class StockTrader: ObservableObject {
    @Published var stockCollection = [StocksOwned]()
    func purchaseStock(ticker: String, amountOfShares: String, completion: @escaping (Bool) -> Void) {
        let user = User.instance
        let data = ["ticker": ticker, "amountOfShares": amountOfShares]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            completion(false)
            return
        }
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "user/purchase")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    DispatchQueue.main.async {
                        self.stockCollection = []
                        completion(true)
                    }
                    return
                }
            }
            DispatchQueue.main.async {
                completion(false)
            }
        }
        task.resume()
    }

    
    func viewStocks(completion: @escaping (Bool) -> Void) async throws {
        let user = User.instance
        
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "user/view/stocks")!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 else {
            completion(false)
            return;
        }
        
        let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
        var stocks = [StocksOwned]()
        for stock in jsonArray {
            let ticker = stock["ticker"] as! String
            let assetType = stock["assetType"] as! String
            let companyName = stock["companyName"] as! String
            let exchange = stock["exchange"] as! String
            let amountOfShares = stock["amountOfShares"] as! Int
            let worth = stock["worth"] as! Double
            stocks.append(StocksOwned(ticker: ticker, assetType: assetType, companyName: companyName, exchange: exchange, amountOfShares: amountOfShares, worth: worth))
        }
        self.stockCollection = stocks
        completion(true)
    }
    
    func sellStocks(ticker: String, amount: Int, completion: @escaping (Bool) -> Void) {
        let user = User.instance
        let data = ["ticker": ticker, "amount": amount] as [String : Any]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            completion(false)
            return
        }
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "user/sell")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(false)
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    completion(true)
                }
            }
            completion(false)
        }
        task.resume()
    }
}
