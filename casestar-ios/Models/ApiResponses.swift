//
//  MovieResponse.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 19/03/2023.
//

import SwiftUI

struct MovieResponse: Codable {
    var page: Int?
    var results: [Movie]?
}


struct Movie: Codable {
    var id: Int = 0
    var title: String = ""
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var original_language: String?
    var vote_count: Int = 0
    var vote_average: Double = 0.0
    var popularity: Double = 0.0
}


struct Actor: Codable {
    var gender: Int?
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
}


struct CastResponse: Codable {
    var id: String?
    var cast: [Actor]
}


struct MovieSearchResponse: Codable {
    var page: Int?
    var results: List<Movie>
}