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
    @State var viewModel: EditBeerViewModel
    @State var alertIsPresented: Bool = false
    
    var body: some View {
        VStack{
            Form {
                
                Section(header: Text("Beer name").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.beer.name)}
                
                Section(header: Text("Beer tagline").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.beer.tagline)}
                
                Section(header: Text("Beer description").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.beer.description)}
                
                Section(header: Text("Beer image link").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.beer.image_url)}
            }
            
            Button("Edit Beer") {
                if (self.viewModel.beer.checkIfNotEmptyOrNil()){
                    beerVm.editBeer(beer: self.viewModel.beer)
                    self.isPresented = false
                } else {
                    self.alertIsPresented.toggle()
                }
            }
            .alert("One or more itens are empty", isPresented: $alertIsPresented ) {
                Button("OK", role: .cancel) { }
            }
        }
    }    
}
