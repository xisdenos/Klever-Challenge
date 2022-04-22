//
//  BeerInfoCell.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 22/04/22.
//

import SwiftUI

struct BeerInfoCell: View {
    
    let beer: Beer
    
    var body: some View {
        VStack{
            
            Text(beer.name)
                .font(.largeTitle .bold())
            
            Text(beer.tagline)
                .font(.title3)
                .padding()
            
            AsyncImage(url: URL(string: beer.image_url)) { phase in
                phase.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 150, height: 360)
            
            Text(beer.description)
                .padding()
                
        }
    }
}
