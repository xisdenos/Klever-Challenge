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
        VStack(alignment: .center, spacing: 30){
            
            Text(beer.name)
                .font(.largeTitle .bold())
                .foregroundColor(.black)
            
            Text(beer.tagline)
                .font(Font.custom("IowanOldStyle-BoldItalic", size: 24))
                .foregroundColor(Color.gray)
                .padding()
            
            AsyncImage(url: URL(string: beer.image_url)) { phase in
                phase.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 150, height: 360)
            
            Text(beer.description)
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .lineSpacing(8)
                
        }
        .multilineTextAlignment(.center)
        .padding(10)
    }
}
