//
//  AddNewBeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation
import SwiftUI

class AddNewBeerViewModel: ObservableObject {
    
    var id: Int = UUID().hashValue
    @Published var name: String = "Generic name"
    @Published var tagline: String = "Very nice"
    @Published var description: String = "Very very Nice"
    @Published var image_url: String = "https://images.punkapi.com/v2/keg.png"
    
    
    init() {
        
    }
    
    func publishNewBeer() -> Beer {
        let newBeer = Beer(id: Int(self.id), name: self.name, tagline: self.tagline, description: self.description, image_url: self.image_url)
        return newBeer
    }
}
