//
//  AccountViewModel.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var isExtranapkinRquired = false
    @Published var frequesntRefil = false
    
    func saveUserData() {
        guard  !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {return}
        let user = User(firstName: firstName, lastName: lastName, birthdate: birthdate, isExtranapkinRquired: isExtranapkinRquired, frequesntRefil: frequesntRefil, email: email)
        do {
            let user =  try JSONEncoder().encode(user)
            userData = user
        } catch  {
            
        }
    }
    
    func fetchUserData() {
        
        guard let data =  userData else {
            return
        }
        do {
            let user =  try JSONDecoder().decode(User.self, from: data)
            firstName = user.firstName
            lastName = user.lastName
            email = user.email
            birthdate = user.birthdate
            isExtranapkinRquired = user.isExtranapkinRquired
            frequesntRefil = user.frequesntRefil
            
        } catch  {
            
        }
    }
}

struct User: Codable {
    let firstName: String
    let lastName: String
    let birthdate : Date
    let isExtranapkinRquired: Bool
    let frequesntRefil :Bool
    let email:String
}
