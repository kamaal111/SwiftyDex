//
//  XiphiasNet+extensions.swift
//
//
//  Created by Kamaal Farah on 11/06/2022.
//

import os.log
import XiphiasNet

extension XiphiasNet {
    func getRequest<T: Decodable>(from endpoint: Endpoint) async -> Result<Response<T>, XiphiasNet.Errors> {
        guard let url = endpoint.url else { return .failure(.invalidURL(url: endpoint.url?.absoluteString ?? "")) }
        if #available(iOS 14.0, macOS 11.0, *) {
            Logger(subsystem: "io.kamaal.PokeAPI", category: "networking").info("GET: \(url.absoluteString)")
        }
        return await request(from: url)
    }
}
