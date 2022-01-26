//
//  ProductImageService.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import UIKit
import Combine


class ProductImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let product: ProductModel
    private let manager = LocalFileManager.instance
    private let folder_name = "product_images"
    private let imageName: String
    
    init(product: ProductModel) {
        self.product = product
        self.imageName = product.date
        getProductImage()
    }
    
    
    private func getProductImage() {
        if let savedImage =  manager.getImage(imageName: imageName, folderName: folder_name) {
            image = savedImage
        } else {
            downloadProductImage()
        }
    }
    
    
    
    private func downloadProductImage() {
        
        guard let url = URL(string: product.image) else{return}
        
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                    let newImage = returnedImage
                else{return}
                self.image = newImage
                self.imageSubscription?.cancel()
                self.manager.saveImage(image: newImage, imageName: self.imageName, name: self.folder_name)
            })
 
    }
    
  
}















