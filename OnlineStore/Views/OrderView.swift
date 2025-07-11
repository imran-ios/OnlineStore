//
//  OrderView.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var vm: Order
    var body: some View {
        NavigationStack {
            if vm.products.count == 0 {
                ContentUnavailableView("No Item in the cart", image: "shopping-cart").foregroundStyle(.brandPrimary)
            }else {
                VStack{
                    List {
                        ForEach(vm.products) { product in
                            ProductRow(product: product)
                            
                        }.onDelete { indexSet in
                            vm.removeOrder(indexSet: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    OSButton(text: Text("₹\(vm.totalCartAmt, specifier: "%.2f") - Place Order"))
                        .padding(.bottom, 20)
                }.navigationTitle("Order View")
                    .onAppear{
                        vm.calculateTotalAmount()
                    }
            }
            
        }
    }
}

#Preview {
    OrderView()
}
