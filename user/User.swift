//
//  User.swift
//  StockMarketUI
//
//  Created by Michael Rasch on 4/3/23.
//

import Foundation

class User {
    
    static let instance = User()
    
    var username: String
    var email: String
    var bearerToken: String
    var balance: String
    
    public init() {
        username = "";
        email = "";
        bearerToken = "";
        balance = "";
    }
    
    func setUsername(username: String) {
        self.username = username
    }
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func setBearerToken(bearerToken: String) {
        self.bearerToken = bearerToken
    }
    func setBalance(balance: String) {
        self.balance = balance
    }
    
    func getUsername() -> String {
        return username;
    }
    
    func getEmail() -> String {
        return email;
    }
    
    func getBearerToken() -> String {
        return bearerToken;
    }
    func getBalance() -> String {
        return balance;
    }
}
