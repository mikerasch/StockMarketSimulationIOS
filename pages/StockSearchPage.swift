//
//  StockSearchPage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/6/23.
//

import SwiftUI

struct StockSearchPage: View {
    @ObservedObject var model = Stocks()
    @State var searchText: String
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack{
                StockView(searchText: $searchText, stockModel: model)
                    .padding(.top,50)
                ScrollView {
                    VStack {
                        ForEach(model.stockCollection) { stock in
                            StockRow(stock: stock)
                        }
                    }
                }
                .listStyle(InsetListStyle())
                Spacer()
            }
        }
    }
}


struct StockRow: View {
    var stock: Stock
    var body: some View {
        VStack(alignment: .leading) {
            Text(stock.name)
                .fontWeight(.heavy)
            HStack {
                Text(stock.exchange)
                    .foregroundColor(Color(.gray))
                Spacer()
                Text(stock.symbol)
                    .bold()
                    .offset(y: -10)
                    .padding(.trailing,20)
            }
        }
    }
}

struct StockSearchPage_Previews: PreviewProvider {
    static var previews: some View {
        StockSearchPage(searchText: "appl")
    }
}
