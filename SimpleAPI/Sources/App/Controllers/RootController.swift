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
        app.get(use: read(req:))
    }

    private func read(req: Request) -> RootResponse {
        RootResponse(hello: "world")
    }
}
