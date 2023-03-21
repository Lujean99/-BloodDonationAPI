import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    //postgesql config
    
    app.databases.use(
    .postgres(hostname: "localhost",
    username: "randalmuhanna",
    password: "vapor",
    database: "patient"),
    as: .psql)
    
    
    //Migration config
    app.migrations.add([PatientTable() ,DonersTable()])
    app.migrations.add(AddColumId())
}
