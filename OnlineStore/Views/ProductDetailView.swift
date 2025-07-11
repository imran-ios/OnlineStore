//
//  ProductDetailView.swift
//  OnlineStore
//
// Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var dismiss:Bool
    @EnvironmentObject var  vm: Order
    var product: Product
    var body: some View {
        VStack{
            ProductRemoteImage(urlString: product.image)
                .frame(height: 225)
                .overlay(alignment: .topTrailing) {
                Button {
                    dismiss.toggle()
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 30,height: 30).foregroundStyle(.black).opacity(0.1)
                        Image(systemName: "multiply").imageScale(.small)
                            .frame(width: 44,height: 44)
                            .tint(.black)
                    }
                   
                }
            }
            Spacer()
            VStack{
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(product.description)
                    .lineLimit(2)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineSpacing(1.2).padding(.vertical)
            }
            
            HStack(spacing: 40){
                VStack(spacing: 5){
                    Text("Category")
                        .fontWeight(.bold)
                        .font(.caption)
                    Text(product.category.rawValue)
                        .fontWeight(.semibold)
                        .italic()
                        .foregroundStyle(.secondary)
                }
                VStack(spacing: 5){
                    Text("Rating")
                        .fontWeight(.bold)
                        .font(.caption)
                    Text("\(product.rating.rate,specifier: "%.0f")")
                        .fontWeight(.semibold)
                        .italic()
                        .foregroundStyle(.secondary)
                }
            }.padding(.vertical)
            Spacer()
            
            Button {
                vm.addOrder(product: product)
                dismiss.toggle()
            } label: {
               
                OSButton(text: Text("₹\(product.price, specifier: "%.2f")- Add To Cart"))
            }.padding(.bottom)
        }
        .frame(maxWidth: .infinity, idealHeight: 500)
        .padding(.horizontal,30)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        
    }
}

#Preview {
    ProductDetailView(dismiss: .constant(false), product:Product.productSample)
}
