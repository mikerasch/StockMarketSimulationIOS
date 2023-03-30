//
//  InputViews.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 3/27/23.
//

import SwiftUI

struct UnsecureField: View {
    var icon: String
    var inputField: String
    @Binding var binding: String
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                TextField(inputField, text: $binding)
                    .bold()
                    .padding(.leading, 65)
                    .background(
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color("ButtonBackground"))
                                .overlay(
                                    Image(systemName: icon)
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                )
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .padding(.trailing,249)
                        }
                    )
                    .frame(width: 300, height: 50)
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(10)
                    .padding(5)
            }
        }
    }
}

struct SecureFieldPassword: View {
    var icon: String
    var inputField: String
    @Binding var password: String
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                SecureField(inputField, text: $password)
                    .bold()
                    .padding(.leading, 65)
                    .background(
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color("ButtonBackground"))
                                .overlay(
                                    Image(systemName: icon)
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                )
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                                .padding(.trailing,249)
                        }
                    )
                    .frame(width: 300, height: 50)
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(10)
                    .padding(5)
            }
        }
    }
}

struct InputViews_Previews: PreviewProvider {
    static var previews: some View {
        UnsecureField(icon: "envelope", inputField: "Enter Email Address", binding: .constant(String()))
        SecureFieldPassword(icon: "lock", inputField: "Enter Password", password: .constant(String()))
    }
}
