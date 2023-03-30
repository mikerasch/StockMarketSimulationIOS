//
//  ContentView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/27/23.
//

import SwiftUI

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .padding(.bottom,-35)
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    UnsecureField(icon: "envelope", inputField: "Enter Email Address", email: $email)
                    SecureFieldPassword(icon: "lock", inputField: "Enter Password", password: $password)
                        .padding()
                    LoginButtonView(username: $email, password: $password)
                    ForgotButtonView()
                        .padding(5)
                    Divider().frame(width: 300,height: 1).background(Color.black)
                        .padding(40)
                    RedirectSignUpView()
                }
                .padding(.top,5)
            }
        }
        .onDisappear {
            email = ""
            password = ""
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LoginPage()
        }
    }
