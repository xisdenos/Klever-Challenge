//
//  BeerListCell.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 22/04/22.
//

import SwiftUI

struct BeerListCell: View {
    
    let beer: Beer
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: beer.image_url)) { phase in
                phase.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 100, height: 260)
            
                .padding()
            VStack{
                Text(beer.name)
                    .font(.title .bold())
                
                    .padding()
                
                Text(beer.tagline)
                    .font(.title2)
            }
        }
    }
}

