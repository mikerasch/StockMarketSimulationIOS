//
//  SettingView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/19/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var text: String
    var body: some View {
        VStack {
            TextField (
                "test",
                text: $text
            )
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .frame(width: 300)
    }
}

struct SaveButtonView: View {
    @Binding var email: String
    @Binding var username: String
    @State private var isLoggedIn = false
    var body: some View {
        NavigationLink(destination: HomePage().navigationBarHidden(true), isActive: $isLoggedIn) {
            EmptyView()
        }
        Button("Save Changes") {
            
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 186, height: 45)
        .background(Color("ButtonBackground"))
        .cornerRadius(20)
        .padding(5)
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(text: .constant("Test"))
    }
}
