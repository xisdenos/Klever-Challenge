//
//  EditBeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct EditBeerView: View {
    
    @EnvironmentObject var beerVm: BeerListViewModel
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: EditBeerViewModel
    
    var body: some View {
        VStack{
            Form {
                
                Section(header: Text("Beer name").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.beer.name)}
                
                Section(header: Text("Beer tagline").font(.body)) {
                    TextField("Enter tagline", text: self.$viewModel.beer.tagline)}
                
                Section(header: Text("Beer description").font(.body)) {
                    TextField("Enter description", text: self.$viewModel.beer.description)}
                
                Section(header: Text("Beer image link").font(.body)) {
                    TextField("Enter image link", text: self.$viewModel.beer.image_url)}
            }
            
            Button("Edit Beer") {
                if (viewModel.checkBeforePublish()){
                    beerVm.editBeer(beer: self.viewModel.beer)
                    self.isPresented = false
                }
            }
            .alert("One or more itens are empty", isPresented: $viewModel.alertIsPresented ) {
                Button("OK", role: .cancel) { }
            }
        }
    }    
}
