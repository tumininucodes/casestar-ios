//
//  RemoteApi.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 18/03/2023.
//

import Foundation
import Alamofire
import Combine


struct RemoteApi {
    
    func headers() -> HTTPHeaders {
        return ["Content-Type": "application/json", "Accept": "application/json"]
    }
    
    var base: URL {
        get {
            return URL(string: "https://api.themoviedb.org/3/")!
        }
    }
    
    var decoder: JSONDecoder {
        get {
            let decoder = JSONDecoder()
            return decoder
        }
    }
    
    func fetchMovies(page: Int) -> AnyPublisher<MovieResponse?, Error> {
        let params:[String: Any] = [
            "api-key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "page": page,
        ]
        return AF.request(base.appendingPathComponent("movie/popular"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: MovieResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> MovieResponse? in
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
    func fetchMovieVideos(movieId: String) -> AnyPublisher<MovieResponse?, Error> {
        let params:[String: Any] = [
            "api-key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "movieId": movieId,
        ]
        return AF.request(base.appendingPathComponent("movie/\(movieId)/videos"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: MovieResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> MovieResponse? in
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
    
    
}

