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
    @State private var showSellSuccessPopup = false
    @State private var showSellFailurePopup = false
    var body: some View {
        Button(action: {
            let stockTrader = StockTrader()
            stockTrader.sellStocks(ticker: stock.ticker, amount: amount) {
                success in
                if success {
                    showSellSuccessPopup = true
                }
                else {
                    showSellFailurePopup = true
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
//        .alert(isPresented: $showSellSuccessPopup) {
//            Alert(title: Text("Sale successful"), message: Text("Your stock sale was successful."), dismissButton: .default(Text("OK")))
//        }
//        .alert(isPresented: $showSellFailurePopup) {
//            Alert(title: Text("Sale failed"), message: Text("Your stock sale was not successful."), dismissButton: .default(Text("OK")))
//        }
    }
}

struct StockSellView_Previews: PreviewProvider {
    static var previews: some View {
        StockSellView(stock: StocksOwned(ticker: "A", assetType: "Stock", companyName: "Alpha", exchange: "NASDAQ", amountOfShares: 5, worth: 20.0), amount: 2)
    }
}
