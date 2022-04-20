//
//  Beer.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

struct Beer: Decodable {
    
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let image_url: String
}
