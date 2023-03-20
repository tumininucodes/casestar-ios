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
    @State var scrollChanger = 0

    
    let columns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(mainVM.movies, id: \.id) { movie in
                                NavigationLink {
                                    AboutMovieView(movie: movie)
                                } label: {
                                    MovieView(imageString: "https://image.tmdb.org/t/p/original\(movie.poster_path ?? "")", title: movie.title)
                                        .onAppear {
                                            let lastMovie = (pageCounter * 20) - pageCounter
                                            if lastMovie == mainVM.movies.firstIndex(where: { $0.id == movie.id }) {
                                                pageCounter += 1
                                                mainVM.getMovies(page: pageCounter)
                                            }
                                        }
                                        .id(movie)
                                }
                               
                            }
                        }
                        .onChange(of: scrollChanger, perform: { newValue in
                            proxy.scrollTo(mainVM.movies[0], anchor: .top)
                        })
                        .padding(.horizontal)
                        
                    }
                    
                    
                    
                }
                
                
            }
            .floatingActionButton(
                color: .accentColor,
                image: Image(systemName: "chevron.left.2")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.white)
            ) {
                print("fab clicked")
                scrollChanger += 1
                
            }
            .navigationBarItems(leading:NavigationLink(destination: FavoritesView(), label: {
                Text("Favorites")
                    .foregroundColor(.accentColor)
            }), trailing: NavigationLink(destination: CreditsView(), label: {
                Text("Credits")
                    .foregroundColor(.accentColor)
            }))
            .navigationTitle("Popular Movies")
            
            if mainVM.isLoading && !mainVM.movies.isEmpty {
                ProgressView()
            }
        }
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
    }
}
