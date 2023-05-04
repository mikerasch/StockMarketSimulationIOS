//
//  StockSellView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/27/23.
//

import SwiftUI

struct StockSellView: View {
    var stock: StocksOwned
    var amount: Int
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showAlert = true
    }
    
    var body: some View {
        Button(action: {
            let stockTrader = StockTrader()
            stockTrader.sellStocks(ticker: stock.ticker, amount: amount) {
                success in
                if success {
                    showAlert(title: "Success", message: "Successfuly Sold " + String(amount) + " of shares of " + stock.ticker)
                }
                else {
                    showAlert(title: "Error", message: "Could not sell shares, please try again later")
                }
            }
        }) {
            Text("Sell")
                .bold()
                .foregroundColor(.white)
                .frame(width: 140, height: 45)
                .background(Color("ButtonBackground"))
                .cornerRadius(20)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct StockSellView_Previews: PreviewProvider {
    static var previews: some View {
        StockSellView(stock: StocksOwned(ticker: "A", assetType: "Stock", companyName: "Alpha", exchange: "NASDAQ", amountOfShares: 5, worth: 20.0), amount: 2)
    }
}
