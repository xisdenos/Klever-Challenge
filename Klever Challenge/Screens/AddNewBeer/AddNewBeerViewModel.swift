//
//  AddNewBeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation
import SwiftUI

struct AddNewBeerViewModelValues {
    
    var id: Int = UUID().hashValue
    var name: String = ""
    var tagline: String = ""
    var description: String = ""
    // image_url not empty for testing with generic image
    var image_url: String = "https://images.punkapi.com/v2/keg.png"
}

class AddNewBeerViewModel: ObservableObject {
    
    @Published var alertIsPresented: Bool = false
    @Published var values: AddNewBeerViewModelValues
    
    init(initialValues: AddNewBeerViewModelValues = .init()) {
        self.values = initialValues
    }
    
    
    func publishNewBeer() -> Beer {
        
        let newBeer = Beer(id: Int(values.id),
                           name: self.values.name,
                           tagline: self.values.tagline,
                           description: self.values.description,
                           image_url: self.values.image_url)
        return newBeer
    }
    
    func checkBeforePublish () -> Bool {
        
        if publishNewBeer().checkIfNotEmptyOrNil() {
            return true
        } else {
            alertIsPresented.toggle()
            return false
        }
    }
}
