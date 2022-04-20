//
//  NetworkConn.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol NetworkConnectionProtocol {
    
    func makeRequest(completion: @escaping (Data?) -> ())
}

class NetworkConnection: NetworkConnectionProtocol {
    
    let base_URL:String = "https://api.punkapi.com/v2/beers"
    
    func makeRequest(completion: @escaping (Data?) -> ()) {
        
        guard let url = URL(string: base_URL) else {
            //TODO - Error Class
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                //TODO - Error Class
                completion(nil)
            }
            
            guard let data = data else {
                //TODO - Error Class
                completion(nil)
                return
            }
            
            completion(data)
        }
        task.resume()
    }
}
