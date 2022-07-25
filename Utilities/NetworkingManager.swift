//
//  NetworkingManager.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-11.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(nsUrl: NSMutableURLRequest)
        case unknown
        
        var errorDescription: String? {
            switch self {
        case .badURLResponse(nsUrl: let url): return "[❌] Bad response from URL: \(url)."
        case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(request: NSMutableURLRequest) -> AnyPublisher<Data, Error> {
        
       return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
             .subscribe(on: DispatchQueue.global(qos: .default))
             .tryMap({try handleURLResponse(output: $0, url: request)})
             .receive(on: DispatchQueue.main)
             .eraseToAnyPublisher()
    }
    
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: NSMutableURLRequest) throws -> Data {
       

        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(nsUrl: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(String(describing: error))
            print("The ERROR IM LOOKING FOR: \(error.localizedDescription)")
        }
    }
}
