//
//  ImageLoaderViewModel.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI

@MainActor
final class ImageLoaderViewModel:ObservableObject {
    @Published var image:Image? = nil
    func load(fromURLString urlString: String)  {
        Task{
         let data =  try? await NetworkManager.shared.loadImage(fromURLString: urlString)
            guard let data = data else {
                return
            }
            guard let uiImage = UIImage(data: data) else {
                return
            }
            image = Image(uiImage: uiImage)
        }
    }
}
