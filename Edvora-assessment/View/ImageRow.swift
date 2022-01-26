//
//  ImageRow.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import SwiftUI

struct ImageRow: View {
    let model: ProductModel
   
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 40){
            ImageView(product: model)
                
            
            VStack(alignment: .leading, spacing: 10) {
                Text(model.product_name)
                    .foregroundColor(.white)
                Text(model.brand_name)
                    .foregroundColor(.gray)
                Text("$\(model.price)")
                    .foregroundColor(.white)
            }
            Spacer()
            
        }
        .padding()
            HStack(spacing: 30){
            Text(model.address.state)
                .frame(width: 120)
                //Spacer()
            Text("Date: \(model.date)")
                .frame(width: 220)
                
        }
            
        .foregroundColor(.gray)
    
            
            Text(model.discription)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .padding()
        .background(Color.black)
        //.padding()
        //.cornerRadius(20)
       
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow( model: ProductModel(product_name: "Amazon pvt ltd", brand_name: "Amazon", price: 300, address: Address(state: "Dadra and Nagar Haveli", city: "Silvassa"), discription: "Its a good product", date: "2012-06-23T21:00:56.042Z", time: "2013-08-23T02:00:06.451Z", image:  "https://www.researchgate.net/profile/Serge-Belongie/publication/221362362/figure/fig2/AS:305566657335318@1449864176496/Sample-of-in-vitro-images-for-different-products.png"))
    }
}
