//
//  ContentView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var beerVM: BeerListViewModel = BeerListViewModel()
    
    var body: some View {
        BeerView(beers: self.beerVM.beers)
            .environmentObject(beerVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
