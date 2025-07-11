//
//  OnlineStoreApp.swift
//  OnlineStore
//
// Created by Md Imran Ali on 11/07/25.
//

import SwiftUI
import SwiftData

@main
struct PostApplicationApp: App {
    @State private var  vm = Order()
    var body: some Scene {
        WindowGroup {
            ProductStoreView()
                .environmentObject(vm)
            
        }
    }
}
