//
//  Beer.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

struct Beer: Decodable {
    
    var id: String
    var name: String
    var tagline: String
    var description: String
    var image_url: String
}
