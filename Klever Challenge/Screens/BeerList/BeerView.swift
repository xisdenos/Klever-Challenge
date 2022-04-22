//
//  BeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import SwiftUI

struct BeerView: View {
    
    var beers: [Beer]
    @State private var showModal: Bool = false
    
    init(beers: [Beer]) {
        self.beers = beers
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(self.beers, id:\.id) { beer in
                    NavigationLink(destination: BeerInfoView(viewModel: BeerInfoViewModel(beer: beer))) {
                        BeerListCell(beer: beer)
                    }
                }
            }
            .navigationBarTitle("Beers List")
            .toolbar {
                Button {
                    self.showModal.toggle()
                }
            label: {
                Label("Add", systemImage: "plus")
            }.foregroundColor(.red)
                    .sheet(isPresented: $showModal) {
                        AddNewBeerView(isPresented: self.$showModal)
                    }
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

