//
//  configure.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // register routes
    try routes(app)
}
