//
//  ImageLoadingViewModel.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var Image: UIImage? = nil
    @Published var isloading: Bool = false
    let urlString: String
    let imageKey: String
    
    var cancellable = Set<AnyCancellable>()
    let manager = Cashing.instance
    
    init(url: String, key : String) {
        urlString = url
        imageKey = key
        downloadImage()
    }
    
    func getImagee() {
        if let savedImage =  manager.get(key: imageKey) {
            Image = savedImage
            print("pulling saved image")
        } else {
            downloadImage()
            print("downloaded image")
        }
    }
    
    func downloadImage() {
        
        isloading = true
        guard let url = URL(string: urlString) else {
            isloading = false
            return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isloading = false
            } receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                    let image = returnedImage else {return}
                self.Image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellable)

    }
}
