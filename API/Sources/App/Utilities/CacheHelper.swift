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

    func withCache<T: Content>(withKey key: String, _ apiCall: () async throws -> T) async throws -> T {
        if exists(key) {
            return try get(from: key).get()
        }

        let response = try await apiCall()

        try? set(key, data: response).get()

        return response
    }

    private func exists(_ key: String) -> Bool {
        let url = makeURL(from: key)
        return fileManager.fileExists(atPath: url.path)
    }

    private func get<T: Decodable>(from key: String) -> Result<T, Abort> {
        let url = makeURL(from: key)
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            logger?.error("error while reading cache file; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        let decodedData: T
        do {
            decodedData = try jsonDecoder.decode(T.self, from: data)
        } catch {
            logger?.error("error while decoding data; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        logger?.info("successfully got cache from \(url.absoluteString)")
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

        let url = makeURL(from: key)
        do {
            try encodedData.write(to: url)
        } catch {
            logger?.error("error while writing data to file; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        logger?.info("successfully wrote cache to \(url.absoluteString)")
        return .success(())
    }

    private func makeURL(from key: String) -> URL {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources")
            .appendingPathComponent(key)
            .appendingPathExtension("json")
    }
}
