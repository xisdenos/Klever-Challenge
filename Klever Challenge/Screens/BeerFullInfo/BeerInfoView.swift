//
//  BeerInfoView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct BeerInfoView: View {
    
    @EnvironmentObject var beerVm: BeerListViewModel
    @ObservedObject var viewModel: BeerInfoViewModel
    
    var body: some View {
        
        ScrollView {
            BeerInfoCell(beer: viewModel.beer)
                .background(Color.yellow)
                .cornerRadius(10)
        }
        
        .toolbar {
            
            HStack{
                Button {
                    viewModel.toogleModal()
                } label: {
                    Label("Edita", systemImage: "pencil")
                }
                .sheet(isPresented: $viewModel.showModal) {
                    EditBeerView(isPresented: $viewModel.showModal, viewModel: EditBeerViewModel(beer: viewModel.beer))
                }
                
                
                Button {
                    beerVm.deleteBeer(beer: viewModel.beer)
                } label: {
                    Label("Delete", systemImage: "trash")
                }.foregroundColor(.red)
            }
        }
    }
}
