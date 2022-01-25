//
//  ProductModel.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation

/*
 "product_name": "Alphabet inc",
     "brand_name": "Alphabet",
     "price": 400,
     "address": {
       "state": "Delhi",
       "city": "New Delhi"
     },
     "discription": "Its a good product",
     "date": "2014-11-13T03:40:38.209Z",
     "time": "2018-11-06T01:13:44.632Z",
     "image": "https://w7.pngwing.com/pngs/915/345/png-transparent-multicolored-balloons-illustration-balloon-balloon-free-balloons-easter-egg-desktop-wallpaper-party-thumbnail.png"
 */

struct ProductModel: Hashable, Codable {
    
    let productName: String
    let brandName: String
    let price: Int
    let address: Address
    let discription : String
    let date: String
    let time: String
    let image: String
 
}

struct Address: Hashable, Codable{
    let state: String
    let city: String
}
