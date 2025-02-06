//
//  AsyncImageWithCache.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

class AsyncImageViewModel: ObservableObject {
    let imageCache = NSCache<NSString, UIImage>()
}

struct AsyncImageWithCache: View {
    var urlString: String
    
    @EnvironmentObject var viewModel: AsyncImageViewModel

    var body: some View {
        let cacheKey = NSString(string: urlString)
        if let image = viewModel.imageCache.object(forKey: cacheKey) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear {
                        if let uiImage = image.render() {
                            viewModel.imageCache.setObject(uiImage, forKey: cacheKey)
                        }
                    }
            } placeholder: {
                Image(systemName: "cat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 4)
                    }
            }
        }
    }
}

#Preview {
    AsyncImageWithCache(urlString: "https://cdn2.thecatapi.com/images/4-5SzDNIL.jpg")
}
