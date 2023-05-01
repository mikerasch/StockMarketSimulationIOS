//
//  DisplayStocksOwnedPage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/20/23.
//

import SwiftUI

struct DisplayStocksOwnedPage: View {
    @ObservedObject var model = StockTrader()
    @State private var isLoading = true
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(4)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        ForEach(model.stockCollection) { stock in
                            SquareView(stock: stock)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 60)
            }
        }
        .onAppear {
            Task {
                do {
                    let success = try await model.viewStocks() {
                        good in
                        if good {
                            isLoading = false;
                        }
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }

    }
}





struct DisplayStocksOwnedPage_Previews: PreviewProvider {
    static var previews: some View {
        DisplayStocksOwnedPage()
    }
}
