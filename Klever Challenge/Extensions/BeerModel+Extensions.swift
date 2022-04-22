//
//  BeerModel+Extensions.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 22/04/22.
//

import Foundation
import SwiftUI

extension Beer {
    
    func checkIfNotEmptyOrNil() -> Bool {
        
        let members = [self.name, self.tagline, self.description, self.image_url]
        
        return members.allSatisfy { $0.isEmpty == false }
    }
}
