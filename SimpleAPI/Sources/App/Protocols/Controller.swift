//
//  Controller.swift
//  
//
//  Created by Kamaal Farah on 14/06/2022.
//

import Vapor

protocol Controller {
    func initializeRoutes(_ app: Application)
}
