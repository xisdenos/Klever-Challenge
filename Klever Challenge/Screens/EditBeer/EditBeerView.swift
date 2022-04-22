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
                beerVm.editBeer(beer: self.viewModel.beer)
                self.isPresented = false
            }
    }
}

//struct EditBeerView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditBeerView(isPresented: .constant(false), beer: Beer(id: 9999,
//                                                               name: "Generic Beer",
//                                                               tagline: "Very good beer",
//                                                               description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                                                               image_url: "https://images.punkapi.com/v2/keg.png"))
//    }
//}
}
