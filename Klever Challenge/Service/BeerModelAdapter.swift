//
//  BeerModelAdapter.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol BeerModelAdapterProtocol {
    
    func fetchBeers(completion: @escaping ([Beer]?, Error?) -> Void)
    func postBeer(beer: Beer, completion: @escaping(Error?) -> Void)
    func deleteBeer(beer: Beer, completion: @escaping(Error?) -> Void)
}

enum ApiAdapterError: Error {
    case InvalidData
    case invalidParse
    case invalidSerialization
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
    
    func postBeer(beer: Beer, completion: @escaping(Error?) -> Void) {
        
        let beerCreateModel = ["id": beer.id,
                               "name": beer.name,
                               "tagline": beer.tagline,
                               "description": beer.description,
                               "image_url": beer.image_url]
        
        guard let beer = try? JSONSerialization.data(withJSONObject: beerCreateModel, options: []) else {
            completion(ApiAdapterError.invalidSerialization)
            return
        }
        
        networkConn.postRequest(beer: beer) { error in
            if error != nil {
                completion(nil)
            }
        }
    }
    
    func deleteBeer(beer: Beer, completion: @escaping(Error?) -> Void) {
        
        let beerId = beer.id
        
        networkConn.deleteRequest(beerId: beerId) { error in
            if error != nil {
                completion(nil)
            }
        }
    }
    
    func updateBeer(beer: Beer, completion: @escaping(Error?) -> Void) {
        
        let beerCreateModel = ["id": beer.id,
                               "name": beer.name,
                               "tagline": beer.tagline,
                               "description": beer.description,
                               "image_url": beer.image_url]
        
        guard let beerData = try? JSONSerialization.data(withJSONObject: beerCreateModel, options: []) else {
            completion(ApiAdapterError.invalidSerialization)
            return
        }
        
        networkConn.updateBeer(beerId: beer.id, beer: beerData) { error in
            if error != nil {
                completion(nil)
            }
        }
    }
}
