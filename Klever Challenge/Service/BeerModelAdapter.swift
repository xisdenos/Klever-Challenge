//
//  BeerModelAdapter.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol BeerModelAdapterProtocol {
    
    func fetchBeers(completion: @escaping ([Beer]?, Error?) -> Void)
}

enum ApiAdapterError: Error {
    case InvalidData
    case invalidParse
}

class BeerModelAdapter: BeerModelAdapterProtocol {
    
    let networkConn: NetworkConnectionProtocol
    
    init(networkConn: NetworkConnectionProtocol){
        
        self.networkConn = networkConn
    }
    
    func fetchBeers(completion: @escaping ([Beer]?, Error?) -> Void) {
        
        networkConn.makeRequest { data, error in
            guard let data = data else {
                completion(nil, ApiAdapterError.InvalidData)
                return
            }
            
            do {
                let beerData = try JSONDecoder().decode([Beer].self, from: data)
                completion(beerData, nil)
                return
            } catch {
                completion(nil, ApiAdapterError.invalidParse)
            }
        }
    }
}
