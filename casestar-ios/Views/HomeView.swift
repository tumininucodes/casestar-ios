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
            GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
            .navigationBarItems(leading:NavigationLink(destination: FavoritesView(), label: {
                Text("Favorites")
                    .foregroundColor(.accentColor)
            }), trailing: NavigationLink(destination: AboutView(), label: {
                Text("Credits")
                    .foregroundColor(.accentColor)
            }))
            .navigationTitle("Popular Movies")
        }
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
    }
}
