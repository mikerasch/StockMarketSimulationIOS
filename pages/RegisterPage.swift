//
//  RegisterView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/27/23.
//

import SwiftUI

struct RegisterPage: View {
    @State private var emailAddress = "";
    @State private var username = "";
    @State private var password = "";
    @State private var confirmPassword = "";
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .padding(.bottom, -35)
                    Text("Register")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    UnsecureField(icon: "envelope", inputField: "Email Address", binding: $emailAddress)
                    UnsecureField(icon: "person.circle", inputField: "Username", binding: $username)
                    SecureFieldPassword(icon: "lock", inputField: "Password", password: $password)
                    SecureFieldPassword(icon: "lock", inputField: "Confirm Password", password: $confirmPassword)
                        .padding(3)
                    SignUpView(email: $emailAddress, username: $username, password: $password, confirmPassword: $confirmPassword)
                    Divider().frame(width: 300,height: 1).background(Color.black)
                        .padding(40)
                    RedirectLoginButton()
                }
            }
        }
        .onDisappear {
            emailAddress = ""
            username = ""
            password = ""
            confirmPassword = ""
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
