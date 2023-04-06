//
//  StockView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/6/23.
//

import SwiftUI

struct StockView: View {
    @Binding var searchText: String
    @ObservedObject var stockModel: Stocks
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Type Stock Ticker", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
                .background(Color(.white))
                .cornerRadius(8)
                .frame(width: 316)
                .multilineTextAlignment(.center)
            Button(action: {
                stockModel.fetchData(ticker: searchText)
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10)
        }
    }
}

