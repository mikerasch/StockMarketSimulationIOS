//
//  BuyPage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/13/23.
//

import SwiftUI

struct BuyPage: View {
    @State var balance = ""
    @State var stock: Stock
    @State var priceOfStock = ""
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            DisplayPriceView(price: self.balance)
                .onAppear {
                    let userService = UserService()
                    let user = User.instance
                    userService.getBalance {
                        success in
                        if success {
                            balance = "$" + user.getBalance()
                        }
                        else {
                            balance = "error"
                        }
                    }
                    userService.getStockPrice(ticker: stock.symbol) { success, price in
                        if success {
                            self.priceOfStock = price ?? "N/A"
                        } else {
                            self.priceOfStock = "Error"
                        }
                    }
                }
            VStack {
                Divider().frame(width: 300,height: 1).background(Color.black)
                    .padding(20)
                Text(stock.name)
                    .bold()
                    .font(.title)
                Text("Price: $" + priceOfStock)
                    .bold()
                    .font(.title)
                HStack {
                    RectangleView(boxInformation: stock.symbol)
                    RectangleView(boxInformation: stock.exchange)
                }
                HStack {
                    RectangleView(boxInformation: stock.assetType)
                    RectangleView(boxInformation: "filler")
                }

                StockCountView(price: Double(priceOfStock) ?? 5.0)
                PurchaseStock()
            }
            .padding(.top, 30)
        }
    }
}


struct BuyPage_Previews: PreviewProvider {
    static var previews: some View {
        BuyPage(stock: Stock(symbol: "ABCD", name: "Apple Bees", exchange: "NASDAQ", assetType: "Good", ipoDate: "someday", delistingDate: "yes", status: "yes"))
    }
}
