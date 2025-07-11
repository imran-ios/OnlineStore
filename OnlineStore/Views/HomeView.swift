//
//  HomeView.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ProductStoreViewModel()
    @State var isPresenting: Bool =  false
    @State var isShowingDetail: Bool =  false
    @State var selectedProduct: Product?
    var alertmsg = ""
    var body: some View {
        NavigationStack {
            ZStack{
                
                List {
                    ForEach(vm.products) { product in
                        ProductRow(product: product).onTapGesture {
                            selectedProduct = product
                            isShowingDetail.toggle()
                        }
                        
                    }
                }
                .listStyle(.plain)
                .blur(radius: isShowingDetail ?  20 : 0)
                .disabled(isShowingDetail ?  true : false)
                if isShowingDetail {
                    ProductDetailView(dismiss: $isShowingDetail, product: selectedProduct ?? Product.productSample).frame(width: 300,height: 525)
                    
                }
                
                if vm.products.count == 0 {
                    ProgressView {
                        Text("Please wait...")
                    }
                }
            }.task(priority: .high) {
                do {
                    try await vm.getAllPosts()
                }catch {
                    
                }
            }
            .navigationTitle("Online Store")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        OrderView()
                    } label: {
                        Image(systemName: "cart")
                            .scaleEffect(1.2)
                    }
                    
                    
                }
            }
            .alert(alertmsg, isPresented: $isPresenting) {
                
            }

        }
    }
    
}

#Preview {
   HomeView()
}

