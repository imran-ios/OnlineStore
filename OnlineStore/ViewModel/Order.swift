//
//  OrderViewModel.swift
//  OnlineStore
//
// Created by Md Imran Ali on 11/07/25.
//

import Foundation

class Order: ObservableObject {
    @Published var products: [Product] = []
    @Published var totalCartAmt: Double = 0.0
    
    func addOrder(product: Product) {
        products.append(product)
    }
    func removeOrder(indexSet: IndexSet) {
        products.remove(atOffsets: indexSet)
        calculateTotalAmount()
    }
    func calculateTotalAmount() {
       totalCartAmt =  products.reduce(0, {$0+$1.price})
    }
}
