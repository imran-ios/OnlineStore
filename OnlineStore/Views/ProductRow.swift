//
//  ProductRow.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

struct ProductRow:View {
    var product: Product
    var body: some View{
        
        
        
        
        VStack{
            HStack{
                
//                AsyncImage(url: URL(string: product.image)) { image in
//                    image.resizable()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                } placeholder: {
//                    ProgressView()
//                }
                ProductRemoteImage( urlString: product.image)
                .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(product.title)
                        .lineLimit(2)
                        .font(.title2)
                        .foregroundStyle(.primary)
                    Text("₹\(product.price, specifier: "%.2f")")
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }.padding(.leading)

            }
           
        } .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}



#Preview {
    ProductRow(product: Product.productSample)
}



