//
//  DataViewModel.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import Combine
import SwiftUI

class DataViewModel: ObservableObject {
    
    @Published var posts: [ProductModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
         
        guard let url = URL(string: "https://assessment-edvora.herokuapp.com/") else {return}
        
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse else {
                        throw URLError(.badServerResponse)
                        
                    }
                return data
            }
            .decode(type: [ProductModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                print("comletion \(completion)")
            } receiveValue: { [weak self] (receivedPost) in
                self?.posts = receivedPost
            }
            .store(in: &cancellables)

    }
    
//    enum selectedOption: String {
//        case Product
//        case State
//        case City
//    }
    
//   
    
    
    func updateFilteredArray() {
        
    }
    
    //var projectItems: [ProductModel] = []
      
 

//    var projectItemsDefaultSorted: [ProductModel] {
//
//        return projectItems.sorted { first, second in
//            if first.address.state ==  {
//                if second.completed == true {
//                    return true
//                }
//            } else if first.completed == true {
//                if second.completed == false {
//                    return false
//                }
//            }
//
//            if first.priority > second.priority {
//                return true
//            } else if first.priority < second.priority {
//                return false
//            }
//
//            return first.itemCreationDate < second.itemCreationDate
//        }
    //}
    

}
