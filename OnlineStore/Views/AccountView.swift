//
//  AccountView.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//


import SwiftUI

struct AccountView: View {
    @State private var vm = AccountViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section("Profile Info") {
                        TextField("First Name", text: $vm.firstName)
                        TextField("Last Name", text: $vm.lastName)
                        TextField("Email Address", text: $vm.email)
                        DatePicker("Birth Date", selection: $vm.birthdate,displayedComponents: .date)
                        Button("Save Changes") {
                            vm.saveUserData()
                        }
                    }
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $vm.isExtranapkinRquired)
                        Toggle("Extra Napkins", isOn: $vm.frequesntRefil)
                    }.tint(.brandPrimary)
                }
            }.onAppear {
                vm.fetchUserData()
            }
            .navigationTitle("Account")
        }
        
    }
}

#Preview {
    AccountView()
}
