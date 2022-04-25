//
//  AddNewBeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct AddNewBeerView: View {
    
    @EnvironmentObject var beerVm: BeerListViewModel
    @ObservedObject private var viewModel: AddNewBeerViewModel = AddNewBeerViewModel()
    
    var body: some View {
        
        VStack{
            Form {
                
                Section(header: Text("Beer name").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.values.name)}
                
                Section(header: Text("Beer tagline").font(.body)) {
                    TextField("Enter tagline", text: self.$viewModel.values.tagline)}
                
                Section(header: Text("Beer description").font(.body)) {
                    TextField("Enter description", text: self.$viewModel.values.description)}
                
                Section(header: Text("Beer image link").font(.body)) {
                    TextField("Enter image link", text: self.$viewModel.values.image_url)}
            }
            
            
            Button("Create new Beer") {
                
                if viewModel.checkBeforePublish(){
                    beerVm.addNewBeer(beer: viewModel.publishNewBeer())
                    beerVm.toogleModal()
                }
            }
            .alert("One or more itens are empty", isPresented: self.$viewModel.alertIsPresented ) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}
