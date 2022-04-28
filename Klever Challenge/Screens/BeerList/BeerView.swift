//
//  BeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import SwiftUI

struct BeerView: View {
    
    var beers: [Beer]
    @ObservedObject private var viewModel: BeerListViewModel = BeerListViewModel()
    
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
            
            .listStyle(PlainListStyle())
            .navigationBarTitle("Favorite Beers!", displayMode: .inline)
            
            .toolbar {
                Button {
                    viewModel.toogleModal()
                }
            label: {
                Label("Add", systemImage: "plus")
            }.foregroundColor(.red)
                    .sheet(isPresented: $viewModel.showModal) {
                        AddNewBeerView()
                    }
            }
        }
        }
    }

