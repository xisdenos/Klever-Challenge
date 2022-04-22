//
//  EditBeerViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation

class EditBeerViewModel: ObservableObject {
    
    @Published var beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }

}
