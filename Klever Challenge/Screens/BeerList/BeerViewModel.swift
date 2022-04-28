//
//  BeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

class BeerListViewModel: ObservableObject {
    
    @Published var beers = [Beer]()
    @Published var showModal: Bool = false
    
    init() {
        fetchBeers()
    }
    
    func fetchBeers() {
        
        BeerModelAdapter(networkConn: NetworkConnection()).fetchBeers { beer, _ in
            if let beer = beer {
                DispatchQueue.main.async() {
                    self.beers = beer
                }
            }
        }
    }
    
    func toogleModal() {
        self.showModal.toggle()
    }
    
    func deleteBeer(beer: Beer) {
        
        BeerModelAdapter(networkConn: NetworkConnection()).deleteBeer(beer: beer) { error in }
        beers = beers.filter {$0.id != beer.id}
    }
    
    func addNewBeer(beer: Beer) {
        
        BeerModelAdapter(networkConn: NetworkConnection()).postBeer(beer: beer) { error in }
        self.beers.append(beer)
    }
    
    
    func editBeer(beer: Beer) {
        
        BeerModelAdapter(networkConn: NetworkConnection()).updateBeer(beer: beer) { error in }
        
        let index = beers.firstIndex { beers in
            beers.id == beer.id
        }
        beers[index!] = beer
    }
}
