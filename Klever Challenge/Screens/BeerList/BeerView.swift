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
        
        List {
            ForEach(self.beers, id:\.id) { beer in
                HStack{
                    Text(String(beer.id))
                    Text(beer.name)
                    Text(beer.tagline)
                    Text(beer.description)
                    Text(beer.image_url)
                }
            }
        }
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beers: [Beer(id: 9999, name: "generic_beer", tagline: "generic beer", description: "generic description", image_url: "generic url")])
    }
}
