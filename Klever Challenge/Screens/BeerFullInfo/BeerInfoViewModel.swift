//
//  BeerInfoViewModel.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import Foundation
import SwiftUI

class BeerInfoViewModel: ObservableObject {
    
    @Published var beer: Beer
    @Published var showModal: Bool = false
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    func toogleModal() {
        showModal.toggle()
    }
}
