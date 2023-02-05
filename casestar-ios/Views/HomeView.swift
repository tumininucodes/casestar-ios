//
//  ContentView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText: String = ""
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            MovieView(imageString: "https://lumiere-a.akamaihd.net/v1/images/pp_disney_blackpanther_wakandaforever_1289_d3419b8f.jpeg", title: "Title")
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
            .navigationBarItems(leading:NavigationLink(destination: FavoritesView(), label: {
                Text("Favorites")
                    .foregroundColor(.accentColor)
            }), trailing: NavigationLink(destination: CreditsView(), label: {
                Text("Credits")
                    .foregroundColor(.accentColor)
            }))
            .navigationTitle("Popular Movies")
        }
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
    }
}
