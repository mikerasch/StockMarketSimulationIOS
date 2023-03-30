//
//  ButtonViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/27/23.
//

import SwiftUI

struct LoginButtonView: View {
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        Button("Login") {
            
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 186, height: 45)
        .background(Color("ButtonBackground"))
        .cornerRadius(20)
        .padding(5)
        
    }
}

struct ForgotButtonView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Forgot Password?")
                .foregroundColor(Color("BackgroundText"))
        }
    }
}

struct RedirectLoginButton: View {
    var body: some View {
        NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true)) {
            Text("Already Have an Account?")
                .foregroundColor(Color("BackgroundText"))
                .padding(.bottom,15)
        }
    }
}

struct RedirectSignUpView: View {
    var body: some View {
        NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true)) {
            Text("Sign Up")
                .bold()
                .foregroundColor(.white)
                .frame(width: 186, height: 45)
                .background(Color("ButtonBackground"))
                .cornerRadius(20)
        }
    }
}


struct SignUpView: View {
    var body: some View {
        Button("Sign Up") {
            
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 186, height: 45)
        .background(Color("ButtonBackground"))
        .cornerRadius(20)
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(username: .constant(""),password: .constant(""))
        ForgotButtonView()
    }
}
