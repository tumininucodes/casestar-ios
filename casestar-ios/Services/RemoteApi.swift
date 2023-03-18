//
//  RemoteApi.swift
//  casestar-ios
//
//  Created by Oluwatumininu Ojo on 18/03/2023.
//

import Foundation
import Alamofire


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
            let formatter = DateFormatter()
            let decoder = JSONDecoder()
            return decoder
        }
    }
    
    
    
    
    
}

