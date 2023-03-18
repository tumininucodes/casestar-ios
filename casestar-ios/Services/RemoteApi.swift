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
            return URL(string: "https://\(AppState.shared.userOrganization).api.javat365.com/".removingPercentEncoding ?? "")!
        }
    }
    
    var decoder: JSONDecoder {
        get {
            let formatter = DateFormatter()
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                let container = try decoder.singleValueContainer()
                let dateStr = try container.decode(String.self)
                
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
                throw DateError.invalidDate
            })
            
            return decoder
        }
    }
    
    
}

