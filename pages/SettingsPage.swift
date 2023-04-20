//
//  SettingsPage.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/19/23.
//

import SwiftUI

struct SettingsPage: View {
    let user = User.instance
    @State var email = User.instance.email
    @State var username = User.instance.username
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text("Edit Profile")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                SettingView(text: $email)
                    .padding(.top, 50)
                SettingView(text: $username)
                    .padding(20)
                SaveButtonView(email: $email, username: $username)
            }
        }
    }
}


struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
