//
//  NetworkManager.swift
//  PostApplication
//
//  Created by Md Imran Ali on 11/07/25.
//

import Foundation

final class NetworkManager {

    static var shared = NetworkManager()
   
    private init() { }
    
    func getAllPosts(urlStr:String) async throws -> Data? {
        guard let url = URL(string: urlStr) else {
            return nil
        }
        let request = URLRequest(url: url)
        let (data, response) = try  await URLSession.shared.data(for: request)
        
       
        let httpResponse  = response as? HTTPURLResponse
        print("response====\(httpResponse?.statusCode ?? 0)")
        if httpResponse?.statusCode == 200 {
            return data
        }else {
            return nil
        }
        
       
    }
    
    func loadImage(fromURLString urlString :String) async throws -> Data? {
         guard let url = URL(string: urlString) else {
            return nil
        }
       
        let request = URLRequest(url: url)
        if let cachedResponse =  URLCache.shared.cachedResponse(for: request){
            print("imagecachedResponse======")
            return cachedResponse.data
        }else {
            let (data, response) = try  await URLSession.shared.data(for: request)
            
           
            let httpResponse  = response as? HTTPURLResponse
            print("response====\(httpResponse?.statusCode ?? 0)")
            if httpResponse?.statusCode == 200 {
                return data
            }else {
                return nil
            }
        }
        
        
       
    }
}
