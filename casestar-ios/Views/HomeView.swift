//
//  ContentView.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 01/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var mainVM = MainVIewModel()
    @State var searchText: String = ""
    @State var pageCounter: Int = 1
    
    
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
                        ForEach(mainVM.movies, id: \.id) { movie in
                            MovieView(imageString: "https://image.tmdb.org/t/p/original\(movie.poster_path ?? "")", title: movie.title)
                                .onAppear {
                                    let lastMovie = (pageCounter * 20) - pageCounter
                                    print(lastMovie)
                                    print(mainVM.movies.count)
                                    if lastMovie == mainVM.movies.firstIndex(where: { $0.id == movie.id }) {
                                        print("========== fetching more ============")
                                        pageCounter += 1
                                        mainVM.getMovies(page: pageCounter)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                }
                
                if mainVM.isLoading && !mainVM.movies.isEmpty {
                    ProgressView()
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
