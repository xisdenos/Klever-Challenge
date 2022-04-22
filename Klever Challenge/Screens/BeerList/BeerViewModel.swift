//
//  BeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

class BeerListViewModel: ObservableObject {
    
    @Published var beers = [Beer]()
    
    init() {
        
        fetchBeers()
    }
    
    func fetchBeers() {
        
        BeerModelAdapter(networkConn: NetworkConnection()).fetchBeers { beer in
            if let beer = beer {
                DispatchQueue.main.sync() {
                    self.beers = beer
                }
            }
        }
    }
    
    func delete() {
        print("dfd")
    }
    
    func addNewBeer(beer: Beer) {
        beers.append(beer)
    }
}
