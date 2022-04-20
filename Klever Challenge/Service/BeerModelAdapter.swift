//
//  BeerModelAdapter.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol BeerModelAdapterProtocol {
    
    func fetchBeers(completion: @escaping ([Beer]?) -> Void)
}

class BeerModelAdapter: BeerModelAdapterProtocol {
    
    let networkConn: NetworkConnectionProtocol
    
    init(networkConn: NetworkConnectionProtocol){
        
        self.networkConn = networkConn
    }
    
    func fetchBeers(completion: @escaping ([Beer]?) -> Void) {
        
        networkConn.makeRequest { data in
            guard let data = data else {
                //Todo - Error Class
                completion(nil)
                return
            }
            
            do {
                let beerData = try JSONDecoder().decode([Beer].self, from: data)
                completion(beerData)
                return
            } catch {
                //TODO - Error Class
                completion(nil)
            }
        }
    }
}
