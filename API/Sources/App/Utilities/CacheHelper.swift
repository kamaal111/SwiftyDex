//
//  CacheHelper.swift
//
//
//  Created by Kamaal M Farah on 18/06/2022.
//

import Vapor
import Foundation

struct CacheHelper {
    private let fileManager: FileManager
    private let logger: Logger?
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()

    init(fileManager: FileManager = .default, logger: Logger? = nil) {
        self.fileManager = fileManager
        self.logger = logger
    }

    func withCache<T: Codable>(withKey key: String,
                               update: Bool = false,
                               _ apiCall: () async throws -> T) async throws -> T {
        if !update, exists(key) {
            return try get(from: key).get()
        }

        let response = try await apiCall()

        try? set(key, data: response).get()

        return response
    }

    private var cacheURL: URL {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")
            .appendingPathComponent("cache")
            .appendingPathExtension("xml")
    }

    private func exists(_ key: String) -> Bool {
        let cache = readCache()
        return cache[key] != nil
    }

    private func get<T: Decodable>(from key: String) -> Result<T, Abort> {
        let cache = readCache()
        guard let data = cache[key] else {
            logger?.error("could not get cache for some reason")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        let decodedData: T
        do {
            decodedData = try jsonDecoder.decode(T.self, from: data)
        } catch {
            logger?.error("error while decoding data; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        logger?.info("successfully got cache of (key=\"\(key)\")")
        return .success(decodedData)
    }

    private func set<T: Encodable>(_ key: String, data: T) -> Result<Void, Abort> {
        let encodedData: Data
        do {
            encodedData = try jsonEncoder.encode(data)
        } catch {
            logger?.error("error while encoding data; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        var cache = readCache()
        cache[key] = encodedData
        logger?.debug("cache keys: \(cache.keys)")
        let cached = NSDictionary(dictionary: cache).write(to: cacheURL, atomically: true)

        guard cached else {
            logger?.error("could not cache for some reason")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        logger?.info("successfully wrote cached to (key=\"\(key)\")")
        return .success(())
    }

    private func readCache() -> [String: Data] {
        let cache = NSDictionary(contentsOf: cacheURL) as? [String: Data]
        return cache ?? [:]
    }
}
