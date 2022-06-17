//
//  configure.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    app.databases.use(.sqlite(.file("api.sqlite")), as: .sqlite)

    // register routes
    try routes(app)
}
