//
//  MainVIewModel.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 19/03/2023.
//

import SwiftUI
import Combine

class MainVIewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    var remoteApi = RemoteApi()
    @Published var isLoading = false
    @Published var isCastLoading = false
    @Published var movies = Array<Movie>()
    @Published var cast = Array<Actor>()
    
    init() {
        getMovies(page: 1)
    }
    
    func getMovies(page: Int) {
        isLoading = true
        remoteApi.fetchMovies(page: page)
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: {_ in
                self.isLoading = false
            }, receiveValue: { response in
                var results = response?.results
                if response?.page == 1 {
                    self.movies.append(contentsOf: response?.results ?? [])
                } else {
                    results?.removeFirst()
                    self.movies.append(contentsOf: results ?? [])
                }
                
            }).store(in: &cancellables)
    }
    
    func getCast(movieId: String) {
        isCastLoading = true
        remoteApi.fetchCast(movieId: movieId)
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: {_ in
                self.isCastLoading = false
            }, receiveValue: { response in
                self.cast = response?.cast ?? []
            }).store(in: &cancellables)
    }
    
}
