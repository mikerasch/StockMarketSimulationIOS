//
//  DisplayStocksOwnedViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/20/23.
//

import SwiftUI


struct SquareView: View {
    let stock: StocksOwned
    @State private var flipped = false
    @State private var isShowingBuyPage = false
    @State private var isShowingSellPage = false

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("ButtonBackground"))
                    .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("ButtonBackground"))
                    .rotation3DEffect(.degrees(flipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                    .overlay(flipped ? Text("$\(Int(stock.worth))").foregroundColor(.black).bold() : Text("\(stock.ticker)").foregroundColor(.black).bold())
            }
            
            NavigationLink(destination: BuyPageExisting(stock: stock), isActive: $isShowingBuyPage) {
                Text("Buy")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: StockSellPage(stock: stock), isActive: $isShowingSellPage) {
                Text("Sell")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                self.flipped.toggle()
            }
        }
    }
}




