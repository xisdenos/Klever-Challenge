//
//  NetworkConn.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol NetworkConnectionProtocol {
    
    func makeRequest(completion: @escaping (Data?, Error?) -> ())
    func postRequest(beer: Beer, completion: @escaping (Error?) -> ())
}

enum ApiNetWorkError: Error {
    case invalidURL
    case InvalidSession
    case invalidDataType
}

class NetworkConnection: NetworkConnectionProtocol {
    
    private let base_URL:String = "https://6269eced737b438c1c3f6090.mockapi.io/beerlist"
    
    func makeRequest(completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = URL(string: base_URL) else {
            completion(nil, ApiNetWorkError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion(nil, ApiNetWorkError.InvalidSession)
            }
            
            guard let data = data else {
                completion(nil, ApiNetWorkError.invalidDataType)
                return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
    
    func postRequest(beer: Beer, completion: @escaping (Error?) -> ()) {
        completion(nil)
    }
}
