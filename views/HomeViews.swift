//
//  HomeViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/5/23.
//

import SwiftUI

struct HomeViews: View {
    var icon: String
    var destination: String
    var body: some View {
        NavigationLink(
            destination: getDestinationView(),
            label: {
                Rectangle()
                    .fill(Color("ButtonBackground"))
                    .frame(width: 162, height: 150)
                    .overlay(
                        Image(systemName: icon)
                            .foregroundColor(.white)
                            .font(.system(size: 70))
                    )
            })
    }
    
    func getDestinationView() -> some View {
        switch destination {
        case "searchStocks":
            return StockSearchPage(searchText: "")
        case "filler":
            return StockSearchPage(searchText: "")
        case "filler1":
            return StockSearchPage(searchText: "")
        case "filler2":
            return StockSearchPage(searchText: "")
        default:
            return StockSearchPage(searchText: "")
        }
    }
}

struct HomeViews_Previews: PreviewProvider {
    static var previews: some View {
        HomeViews(icon: "magnifyingglass",destination: "searchStocks")
    }
}
