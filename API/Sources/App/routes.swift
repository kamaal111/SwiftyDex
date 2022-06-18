//
//  routes.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor

let controllers: [Controller] = [
    RootController(),
    PokemonController(),
]

func routes(_ app: Application) throws {
    for controller in controllers {
        controller.initializeRoutes(app)
    }
}
