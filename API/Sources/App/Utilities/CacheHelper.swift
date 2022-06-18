//
//  CacheHelper.swift
//  
//
//  Created by Kamaal M Farah on 18/06/2022.
//

import Foundation
import Vapor

struct CacheHelper {
    private let fileManager: FileManager
    private let logger: Logger?
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()

    init(fileManager: FileManager = .default, logger: Logger? = nil) {
        self.fileManager = fileManager
        self.logger = logger
    }

    func exists(_ url: URL) -> Bool {
        fileManager.fileExists(atPath: url.path)
    }

    func get<T: Decodable>(from url: URL) -> Result<T, Abort> {
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

    func set<T: Encodable>(_ url: URL, data: T) -> Result<Void, Abort> {
        let encodedData: Data
        do {
            encodedData = try jsonEncoder.encode(data)
        } catch {
            logger?.error("error while encoding data; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        do {
            try encodedData.write(to: url)
        } catch {
            logger?.error("error while writing data to file; \(error)")
            return .failure(Abort(.internalServerError, reason: "Something went wrong"))
        }

        logger?.info("successfully wrote cache to \(url.absoluteString)")
        return .success(())
    }
}
