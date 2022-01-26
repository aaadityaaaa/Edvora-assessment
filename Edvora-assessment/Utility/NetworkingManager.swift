//
//  NetworkingManager.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//


import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        
        case badURLResposne
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResposne:
               return "baddddd "
            case .unknown:
                return "unoknmow shit"
            }
        }
        
        
    }

    //by creating a static func we don't need to initialise this class and we can just call class.func
    static func download(url: URL) -> AnyPublisher<Data, Error>{
      return  URLSession.shared.dataTaskPublisher(for: url)
             .subscribe(on: DispatchQueue.global(qos: .default))
             .tryMap({ try handleURLResponse(output: $0)} )
             .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        
        guard let response = output.response as? HTTPURLResponse else{
            throw
            NetworkingError.badURLResposne}
        
        return output.data
    
        
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    
    
}














