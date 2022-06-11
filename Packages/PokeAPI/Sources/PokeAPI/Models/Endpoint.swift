//
//  Endpoint.swift
//  
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2\(path)"
        components.queryItems = queryItems

        return components.url
    }
}
