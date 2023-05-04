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
    @State private var registrationSuccessful = false
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showAlert = true
    }
    var isUsernameValid: Bool {
        return !username.isEmpty
    }
    var isPasswordValid: Bool {
        return !password.isEmpty
    }
    var body: some View {
        NavigationLink(destination: HomePage().navigationBarHidden(true), isActive: $isLoggedIn) {
            EmptyView()
        }
        Button("Login") {
            if !isUsernameValid {
                showAlert(title: "Invalid Username", message: "Username cannot be empty.")
            }
            else if !isPasswordValid {
                showAlert(title: "Invalid Password", message: "Password cannot be empty.")
            }
            else {
                let loginService = LoginService()
                loginService.loginPost(username: username, password: password) {
                    success in
                    if success {
                        isLoggedIn = true
                    }
                    else {
                        showAlert(title: "Login Failed", message: "Invalid email or password.")
                    }
                }
            }
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 186, height: 45)
        .background(Color("ButtonBackground"))
        .cornerRadius(20)
        .padding(5)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
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
    @State private var registrationSuccessful = false
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showAlert = true
    }
    
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    var isPasswordValid: Bool {
        if password.isEmpty || confirmPassword.isEmpty {
            return false;
        }
        if password == confirmPassword {
            return true;
        }
        return false;
    }
    var isUsernameValid: Bool {
        return !username.isEmpty;
    }
    var body: some View {
        NavigationLink(destination: LoginPage(), isActive: $registrationSuccessful) {
            EmptyView()
        }
        Button("Sign Up") {
            let registerPage = RegisterService()
            if !isEmailValid {
                showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            } else if !isUsernameValid {
                showAlert(title: "Invalid Username", message: "Username cannot be empty.")
            } else if !isPasswordValid {
                showAlert(title: "Invalid Password", message: "Passwords must match and cannot be empty.")
            } else {
                registerPage.RegisterPost(email: email, username: username, password: password, confirmPassword: confirmPassword) { success in
                    if success {
                        self.registrationSuccessful = true
                    } else {
                        showAlert(title: "Registration Failed", message: "Registration Failed, Try Again Later")
                    }
                }
            }
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 186, height: 45)
        .background(Color("ButtonBackground"))
        .cornerRadius(20)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(username: .constant(""),password: .constant(""))
        ForgotButtonView()
        ContactUsView()
    }
}
