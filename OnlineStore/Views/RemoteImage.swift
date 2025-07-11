//
//  RemoteImage.swift
//  OnlineStore
//
//  Created by Md Imran Ali on 11/07/25.
//

import SwiftUI


struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("productplaceholder").resizable()
    }
}

struct ProductRemoteImage: View {
    @StateObject var imageLoader = ImageLoaderViewModel()
    let urlString:String

    var body: some View {
        RemoteImage(image: imageLoader.image).onAppear{
            imageLoader.load(fromURLString: urlString)
        }
    }
}

#Preview {
    RemoteImage()
}
