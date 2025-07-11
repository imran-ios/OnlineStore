//
//  ProductStoreViewModel.swift
//  PostApplication
//
//  Created by Md Imran Ali on 11/07/25.
//

import Foundation
let baseURL = "https://fakestoreapi.com/"
@MainActor
class ProductStoreViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    let networkManager: NetworkManager
    
    init( networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
        
    }
    
    func getAllPosts() async throws {
        let url = baseURL.appending("products")
        let data = try? await networkManager.getAllPosts(urlStr: url)
        
        guard let data = data else {
            return
        }
        do {
            products =   try JSONDecoder().decode([Product].self, from: data)
        print("product====\(products)")
        } catch  {
            print("error===\(error.localizedDescription)")
        }
        
    }
    
}


