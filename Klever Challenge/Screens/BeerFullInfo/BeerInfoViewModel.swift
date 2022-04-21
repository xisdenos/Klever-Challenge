//
//  BeerInfoViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation

class BeerInfoViewModel {
    
    let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    func delete() {
        print("delete")
    }
}
