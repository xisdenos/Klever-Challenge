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
        HStack(spacing: 50){
            AsyncImage(url: URL(string: beer.image_url)) { phase in
                phase.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 100, height: 260)
            

            VStack(alignment: .center, spacing: 40){
                Text(beer.name)
                    .font(Font.custom("ArialHebrew-Bold", size: 26))
                    .foregroundColor(.black)
                    .frame(minWidth: 150)
                
                Text(beer.tagline)
                    .font(Font.custom("IowanOldStyle-BoldItalic", size: 22))
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

