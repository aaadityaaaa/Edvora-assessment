//
//  ProductDataService.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import Combine

class ProductDataService {
    
    @Published var allProducts: [ProductModel] = []
    var productSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    func getCoins() {
        guard let url = URL(string: "https://assessment-edvora.herokuapp.com") else{return}
        
        
        productSubscription = NetworkingManager.download(url: url)
            .decode(type: [ProductModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedProducts in
                self?.allProducts = returnedProducts
                self?.productSubscription?.cancel()
            })

    }
    
    
}

