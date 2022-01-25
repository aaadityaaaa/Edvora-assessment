//
//  ImageView.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key : String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    

    
    var body: some View {
        ZStack {
            if loader.isloading {
                ProgressView()
            } else if let image = loader.Image {
               Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
    }
}
