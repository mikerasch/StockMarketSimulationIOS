//
//  RegisterView.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/27/23.
//

import SwiftUI

struct RegisterView: View {
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
                    UnsecureField(icon: "envelope", inputField: "Email Address", email: $emailAddress)
                    UnsecureField(icon: "person.circle", inputField: "Username", email: $username)
                    UnsecureField(icon: "lock", inputField: "Password", email: $password)
                    UnsecureField(icon: "lock", inputField: "Confirm Password", email: $confirmPassword)
                        .padding(3)
                    SignUpView()
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
        RegisterView()
    }
}
