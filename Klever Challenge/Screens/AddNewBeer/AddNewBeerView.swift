//
//  AddNewBeerView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct AddNewBeerView: View {
    
    @EnvironmentObject var beerVm: BeerListViewModel
    @Binding var isPresented: Bool
    @State private var viewModel: AddNewBeerViewModel = AddNewBeerViewModel()
    @State var alertIsPresented: Bool = false
    
    var body: some View {
        
        VStack{
            Form {
                
                Section(header: Text("Beer name").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.name)}
                
                Section(header: Text("Beer tagline").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.tagline)}
                
                Section(header: Text("Beer description").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.description)}
                
                Section(header: Text("Beer image link").font(.body)) {
                    TextField("Enter name", text: self.$viewModel.image_url)}
            }
            
            
            
            Button("Create new Beer") {
                if self.viewModel.publishNewBeer().checkIfNotEmptyOrNil() {
                    beerVm.addNewBeer(beer: viewModel.publishNewBeer())
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
