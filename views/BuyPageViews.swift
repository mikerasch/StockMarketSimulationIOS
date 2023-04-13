//
//  BuyPageViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/13/23.
//

import SwiftUI

struct DisplayPriceView: View {
    var price: String
    var body: some View {
        VStack{
            Text("Current Balance")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
                .padding(.top,20)
            Text(price)
                .fontWeight(.medium)
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct DisplayStockInformationView: View {
    var stock: Stock
    var body: some View {
        RectangleView(boxInformation: "test")
    }
}

struct RectangleView: View {
    var boxInformation: String
    var body: some View {
        Rectangle()
            .fill(Color("ButtonBackground"))
            .frame(width: 162, height: 150)
            .overlay(
                Text(boxInformation)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            )
    }
}

struct StockCountView: View {
    @State var count: Int = 0
    var price: Double
    @State var displayPrice = 0.0
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.count += 1
                    displayPrice += price
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(Color(red: 34/255, green: 70/255, blue: 50/255))
                }
                .padding(.trailing, 8)
                
                Text("\(count)")
                    .font(.title)
                
                Button(action: {
                    if count != 0 {
                        self.count -= 1
                        displayPrice -= price
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
                .padding(.leading, 8)
            }
            Text("Price: $" + String(format: "%.2f", displayPrice))
                .padding(.leading, -2)
        }
        .padding()
        .cornerRadius(10)
    }
}

struct PurchaseStock: View {
    var body: some View {
            Text("Purchase")
                .bold()
                .foregroundColor(.white)
                .frame(width: 186, height: 45)
                .background(Color("ButtonBackground"))
                .cornerRadius(20)
    }
}

struct BuyPageViews_Previews: PreviewProvider {
    static var previews: some View {
        DisplayPriceView(price: "$20.00")
        DisplayStockInformationView(stock: Stock(symbol: "a", name: "a", exchange: "a", assetType: "a", ipoDate: "a", delistingDate: "a", status: "a"))
        StockCountView(price: 222)
    }
}