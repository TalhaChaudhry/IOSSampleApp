//
//  RMRequest.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 24/09/2023.
//

import Foundation

final class RMRequest{
    
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api/"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    private var urlString: String{
        var string = Constants.baseUrl
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
           string += argumentString
        }
        
        return string
    }
    var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    init(endpoint: RMEndpoint,
         pathComponents: [String] = [],
         queryParameters: [URLQueryItem] = []
    ){
        self.endpoint=endpoint
        self.pathComponents=pathComponents
        self.queryParameters=queryParameters
    }
}

extension RMRequest{
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
