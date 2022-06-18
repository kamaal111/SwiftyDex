//
//  RootController.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor

struct RootResponse: Content {
    let hello: String
}

struct RootController: Controller {
    func initializeRoutes(_ app: Application) {
        app.get(use: read(request:))
    }

    private func read(request _: Request) -> RootResponse {
        RootResponse(hello: "world")
    }
}
