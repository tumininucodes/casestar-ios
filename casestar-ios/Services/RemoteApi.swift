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
            "api_key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "page": "\(page)",
        ]
        return AF.request(base.appendingPathComponent("movie/popular"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: MovieResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> MovieResponse? in
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
    func fetchMovieVideos(movieId: String) -> AnyPublisher<MovieVideosResponse?, Error> {
        let params:[String: Any] = [
            "api_key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "movieId": movieId,
        ]
        return AF.request(base.appendingPathComponent("movie/\(movieId)/videos"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: MovieVideosResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> MovieVideosResponse? in
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
    func searchMovie(query: String) -> AnyPublisher<MovieSearchResponse?, Error> {
        let params:[String: Any] = [
            "api_key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "query": query,
            "include_adult": "false",
        ]
        return AF.request(base.appendingPathComponent("search/movie"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: MovieSearchResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> MovieSearchResponse? in
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
    func fetchCast(movieId: String) -> AnyPublisher<CastResponse?, Error> {
        let params:[String: Any] = [
            "api_key": "703b66873479afc02f4d7afd1ae87125",
            "language": "en-US",
            "movieId": movieId,
        ]
        return AF.request(base.appendingPathComponent("movie/\(movieId)/credits"), method: .get, parameters: params, encoding: URLEncoding.queryString, headers: self.headers())
            .publishDecodable(type: CastResponse.self, decoder: decoder)
            .tryCompactMap { (response) -> CastResponse? in
                print(response.debugDescription)
                if let error = response.error { throw error }
                return response.value
            }.eraseToAnyPublisher()
    }
    
    
}

