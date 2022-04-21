//
//  BeerInfoView.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 21/04/22.
//

import SwiftUI

struct BeerInfoView: View {
    
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
                    viewModel.editBeer()
                } label: {
                    Label("Edita", systemImage: "pencil")
                }
                
                
                Button {
                    viewModel.deleteBeer()
                } label: {
                    Label("Delete", systemImage: "trash")
                }.foregroundColor(.red)
            }
        }
    }
    
    struct BeerInfoView_Previews: PreviewProvider {
        static var previews: some View {
            BeerInfoView(viewModel: BeerInfoViewModel(beer: Beer(id: 9999,
                                         name: "Generic Beer",
                                         tagline: "Very good beer",
                                         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                         image_url: "https://images.punkapi.com/v2/keg.png"))
        )}
    }
                         
    
    struct BeerInfoCell: View {
        
        let beer: Beer
        
        var body: some View {
            VStack{
                
                Text(beer.name)
                    .font(.largeTitle .bold())
                
                Text(beer.tagline)
                    .font(.title3)
                    .padding()
                
                AsyncImage(url: URL(string: beer.image_url)) { phase in
                    phase.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 150, height: 360)
                
                Text(beer.description)
                    .padding()
            }
            
        }
    }
}
