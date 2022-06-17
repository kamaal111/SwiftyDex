//
//  main.swift
//
//
//  Created by Kamaal Farah on 14/06/2022.
//

import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
try configure(app)
try app.run()
