//
//  BeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import SwiftUI

struct BeerView: View {
    
    let beers: [Beer]
    
    init(beers: [Beer]) {
        self.beers = beers
    }
    
    var body: some View {
        NavigationView{
        List {
            ForEach(self.beers, id:\.id) { beer in
                BeerCellView(beer: beer)
                }
            }
        }
    }

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beers: [Beer(id: 9999,
                              name: "generic_beer",
                              tagline: "generic beer",
                              description: "generic description",
                              image_url: "https://images.punkapi.com/v2/keg.png")])
    }
}
}

struct BeerCellView: View {
    
    let beer: Beer
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: beer.image_url)) { phase in
                phase.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 110, height: 260)
            
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
