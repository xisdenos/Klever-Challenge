//
//  EditBeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation
import SwiftUI

struct EditBeerViewModelValues {
    
    var id: Int = UUID().hashValue
    var name: String = ""
    var tagline: String = ""
    var description: String = ""
    // image_url not empty for testing with generic image
    var image_url: String = "https://images.punkapi.com/v2/keg.png"
}


class EditBeerViewModel: ObservableObject {
    
    @Published var beer: Beer
    @Published var alertIsPresented: Bool = false
    
    var values: EditBeerViewModelValues
    
    init(beer: Beer, initialValues: EditBeerViewModelValues = .init() ) {
        self.beer = beer
        self.values = initialValues
    }
    
    func checkBeforePublish () -> Bool {
        
        if beer.checkIfNotEmptyOrNil() {
            return true
        } else {
            alertIsPresented.toggle()
            return false
        }
    }

}
