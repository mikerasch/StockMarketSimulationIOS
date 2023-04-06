import Foundation
class Stocks: ObservableObject {
    @Published var stockCollection = [Stock]()
    func fetchData(ticker: String) {
        stockCollection = []
        let user = User.instance
        var request = URLRequest(url: URL(string: Constants.BASE_URL + "stocks/ticker/contains")!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + user.getBearerToken(), forHTTPHeaderField: "Authorization")
        request.setValue(ticker, forHTTPHeaderField: "ticker")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                return
            }
            if let httpStatus = response as? HTTPURLResponse {
                if httpStatus.statusCode == 200 {
                    let responseBodyString = String(data: data!, encoding: .utf8)
                    if let json = self.parseDataToJson(responseBody: responseBodyString!) {
                        self.storeUserData(json: json)
                        return
                    }
                }
            }
        }
        task.resume()
    }
    
    func storeUserData(json: [Any]) {
        for case let jsonStock as [String: Any] in json {
            guard let symbol = jsonStock["symbol"] as? String,
                  let name = jsonStock["name"] as? String,
                  let exchange = jsonStock["exchange"] as? String,
                  let assetType = jsonStock["assetType"] as? String,
                  let ipoDate = jsonStock["ipoDate"] as? String,
                  let delistingDate = jsonStock["delistingDate"] as? String,
                  let status = jsonStock["status"] as? String
                  else {
                continue
            }
            let stock = Stock(symbol: symbol, name: name, exchange: exchange, assetType: assetType, ipoDate: ipoDate,delistingDate: delistingDate, status: status)
            stockCollection.append(stock)
        }
    }

    func parseDataToJson(responseBody: String) -> [Any]? {
        if let data = responseBody.data(using: .utf8) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] {
                    return json
                } else {
                    return nil
                }
            } catch {
                return nil
            }
        }
        return nil
    }

}

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let exchange: String
    let assetType: String
    let ipoDate: String
    let delistingDate: String
    let status: String
}
