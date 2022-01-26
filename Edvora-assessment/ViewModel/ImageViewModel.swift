//
//  ImageLoadingViewModel.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import UIKit
import Combine


class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    @Published var isloading: Bool = false
    private var cancellable = Set<AnyCancellable>()
    
    private let product: ProductModel
    
    private let dataService: ProductImageService
    
    init(product: ProductModel) {
        self.dataService = ProductImageService(product: product)
        self.product = product
        self.addSubscribers()
        self.isloading = true
    }
    
    
    private func addSubscribers() {
        
        dataService.$image
            .sink { [weak self] _ in
                self?.isloading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellable)
   
    }
    
}
