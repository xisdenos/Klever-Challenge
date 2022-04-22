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
    
    func deleteBeer(beer: Beer) {
        beers = beers.filter {$0.id != beer.id}
    }
    
    func addNewBeer(beer: Beer) {
        beers.append(beer)
    }
    
    func editBeer(beer: Beer) {
        let index = beers.firstIndex { beers in
            beers.id == beer.id
        }
        beers[index!] = beer
    }
}
