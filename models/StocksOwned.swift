//
//  StocksOwned.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/20/23.
//

import Foundation

struct StocksOwned: Identifiable {
    let id = UUID()
    let ticker: String
    let assetType: String
    let companyName: String
    let exchange: String
    let amountOfShares: Int
    let worth: Double

}
