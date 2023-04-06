//
//  HomePage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/5/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all)
                VStack(spacing: 90) {
                    HStack(spacing: 20) {
                        HomeViews(icon: "magnifyingglass")
                        HomeViews(icon: "dollarsign.square")
                    }
                    HStack(spacing: 20) {
                        HomeViews(icon: "person.circle")
                        HomeViews(icon: "chart.bar.fill")
                    }
                    Divider().frame(width: 300,height: 1).background(Color.black)
                    ContactUsView()
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: LoginPage().navigationBarHidden(true)) {
                        Image(systemName: "escape")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .padding(.leading, 20)
                    }
                }
            }
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
