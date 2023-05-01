//
//  StockSellPage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/27/23.
//

import SwiftUI

struct StockSellPage: View {
    @State var stock: StocksOwned
    @State var countOfStock = 0
    
    var priceOfStock: Double {
        return stock.worth / Double(stock.amountOfShares)
    }
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text("Sell Stock")
                    .font(.title)
                    .padding()
                Text(stock.companyName)
                StockCountView(count: $countOfStock, price: priceOfStock)
                StockSellView(stock: stock, amount: countOfStock)
            }
        }
    }
}

struct StockSellPage_Previews: PreviewProvider {
    static var previews: some View {
        StockSellPage(stock: StocksOwned(ticker: "A", assetType: "Stock", companyName: "Alpha", exchange: "NASDAQ", amountOfShares: 5, worth: 20.0))
    }
}
