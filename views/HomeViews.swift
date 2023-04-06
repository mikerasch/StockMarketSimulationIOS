//
//  HomeViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/5/23.
//

import SwiftUI

struct HomeViews: View {
    var icon: String
    
    var body: some View {
        Rectangle()
            .fill(Color("ButtonBackground"))
            .frame(width: 162, height: 150)
            .overlay(
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 70))
            )
    }
}

struct HomeViews_Previews: PreviewProvider {
    static var previews: some View {
        HomeViews(icon: "magnifyingglass")
    }
}
