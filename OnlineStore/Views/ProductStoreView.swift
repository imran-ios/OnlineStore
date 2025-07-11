//
//  ProductStoreView.swift
//  PostApplication
//
// Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

enum TabValue:Int {
    case home = 1
    case profile = 2
    case order = 3
}

struct ProductStoreView: View {
    @State private var selectedTab:TabValue = .home
    var body: some View {
        TabView(selection: $selectedTab){
            Tab(value: .home) {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab(value: .home) {
                AccountView()
            } label: {
                Label("Account", systemImage: "person")
            }
            
            
            Tab(value: .home) {
                OrderView()
            } label: {
                Label("Order", systemImage: "bag")
            }

            
        }.tint(.brandPrimary)
    }
}


#Preview {
    ProductStoreView()
    
  
}



