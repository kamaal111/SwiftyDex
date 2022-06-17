//
//  PaginatedResponse.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import Foundation

public struct PaginatedResponse<T: Codable>: Codable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [T]

    public init(count: Int, next: String?, previous: String?, results: [T]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
