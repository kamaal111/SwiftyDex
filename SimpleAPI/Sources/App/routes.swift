import Vapor

let controllers: [Controller] = [
    RootController()
]

func routes(_ app: Application) throws {
    for controller in controllers {
        controller.initializeRoutes(app)
    }
}
