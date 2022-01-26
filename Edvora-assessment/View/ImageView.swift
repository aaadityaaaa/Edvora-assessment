//
//  ImageView.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject var vm: ImageViewModel
    
    init(product: ProductModel) {
        _vm = StateObject(wrappedValue: ImageViewModel(product: product))
    }
    
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFill()
                    .cornerRadius(10)
            } else if vm.isloading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(product: ProductModel(product_name: "Amazon pvt ltd", brand_name: "Amazon", price: 300, address: Address(state: "Dadra and Nagar Haveli", city: "Silvassa"), discription: "Its a good product", date: "2012-06-23T21:00:56.042Z", time: "2013-08-23T02:00:06.451Z", image:  "https://www.researchgate.net/profile/Serge-Belongie/publication/221362362/figure/fig2/AS:305566657335318@1449864176496/Sample-of-in-vitro-images-for-different-products.png"))
    }
}
