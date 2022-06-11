//
//  Client.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation
import XiphiasNet

protocol Client {
    var networker: XiphiasNet { get }
}

public enum ClientErrors: Error, Equatable {
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

extension Client {
    func getRequest<T: Decodable>(from endpoint: Endpoint) async -> Result<T, ClientErrors> {
        await networker.getRequest(from: endpoint)
            .map(\.data)
            .mapError(mapError)
    }

    private func mapError(_ error: XiphiasNet.Errors) -> ClientErrors {
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
