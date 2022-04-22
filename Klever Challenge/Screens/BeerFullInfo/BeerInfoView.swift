//
//  BeerInfoView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct BeerInfoView: View {
    
    @EnvironmentObject var beerVm: BeerListViewModel
    @State private var showModal: Bool = false
    var viewModel: BeerInfoViewModel
    
    init(viewModel: BeerInfoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView{
            BeerInfoCell(beer: viewModel.beer)
            
        }.toolbar {
            
            HStack{
                Button {
                    self.showModal.toggle()
                } label: {
                    Label("Edita", systemImage: "pencil")
                }
                .sheet(isPresented: $showModal) {
                    EditBeerView(isPresented: self.$showModal, viewModel: EditBeerViewModel(beer: viewModel.beer))
                }
                
                
                Button {
                    beerVm.deleteBeer(beer: viewModel.deleteBeer())
                } label: {
                    Label("Delete", systemImage: "trash")
                }.foregroundColor(.red)
            }
        }
    }
}
