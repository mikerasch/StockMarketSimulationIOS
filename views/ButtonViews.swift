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
    @State private var isLoggedIn = false
    var body: some View {
        NavigationLink(destination: HomePage().navigationBarHidden(true), isActive: $isLoggedIn) {
            EmptyView()
        }
        Button("Login") {
            let loginService = LoginService()
            loginService.loginPost(username: username, password: password) {
                success in
                if success {
                    isLoggedIn = true
                }
                else {
                    print("login failed")
                }
            }
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

struct ContactUsView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Contact Us")
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
        NavigationLink(destination: RegisterPage().navigationBarBackButtonHidden(true)) {
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
    @Binding var email: String
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    var body: some View {
        Button("Sign Up") {
            let registerPage = RegisterService()
            registerPage.RegisterPost(email: email, username: username, password: password, confirmPassword: confirmPassword) { success in
                if success {
                    print("Registration successful")
                } else {
                    print("Registration failed")
                }
            }
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
        ContactUsView()
    }
}
