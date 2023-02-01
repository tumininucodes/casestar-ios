//
//  ContentView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Casestar")
        }
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
    }
}
