//
//  ClientKit.swift
//
//
//  Created by Kamaal Farah on 17/06/2022.
//

import Foundation
import XiphiasNet
import os.log

public protocol ClientKit {
    var networker: XiphiasNet { get }
}

public enum ClientKitErrors: Error, Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifier == rhs.identifier
    }

    case generalError(error: Error)
    case responseError(message: String, code: Int)
    case notAValidJSON
    case parsingError(error: Error)
    case invalidURL(url: String)

    private var identifier: String {
        switch self {
        case let .generalError(error: error): return "general_error_\(error.localizedDescription)"
        case let .responseError(message: message, code: code): return "response_error_\(message)_\(code)"
        case .notAValidJSON: return "not_a_valid_json"
        case let .parsingError(error: error): return "parsing_error_\(error.localizedDescription)"
        case let .invalidURL(url: url): return "invalid_url_\(url)"
        }
    }
}

public struct Endpoint {
    public let path: String
    public let queryItems: [URLQueryItem]

    public init(path: String, queryItems: [URLQueryItem]) {
        self.path = path
        self.queryItems = queryItems
    }

    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2\(path)"

        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        return components.url
    }
}


extension ClientKit {
    public func getRequest<T: Decodable>(from endpoint: Endpoint) async -> Result<T, ClientKitErrors> {
        await networker.getRequest(from: endpoint)
            .map(\.data)
            .mapError(mapError)
    }
}

extension ClientKit {
    fileprivate func mapError(_ error: XiphiasNet.Errors) -> ClientKitErrors {
        switch error {
        case let .generalError(error: error):
            return .generalError(error: error)
        case let .responseError(message: message, code: code):
            return .responseError(message: message, code: code)
        case .notAValidJSON:
            return .notAValidJSON
        case let .parsingError(error: error):
            return .parsingError(error: error)
        case let .invalidURL(url: url):
            return .invalidURL(url: url)
        }
    }
}

extension XiphiasNet {
    func getRequest<T: Decodable>(from endpoint: Endpoint) async -> Result<Response<T>, XiphiasNet.Errors> {
        guard let url = endpoint.url else { return .failure(.invalidURL(url: endpoint.url?.absoluteString ?? "")) }
        if #available(iOS 14.0, macOS 11.0, *) {
            Logger(subsystem: "io.kamaal.PokeAPI", category: "networking").info("GET: \(url.absoluteString)")
        }
        return await request(from: url)
    }
}
