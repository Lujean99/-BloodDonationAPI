//
//  DonersPatient.swift
//  
//
//  Created by Rand AlMuhanna on 26/08/1444 AH.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent

struct PatientTable : Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("patient")
            .id()
            .field("firstname" , .string)
            .field("lastname" , .string)
            .field("phonenumber" , .int)
            .field("gender" , .string)
            .field("age" , .int)
            .field("bloodtype" , .string)

            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("patient")
            .delete()
    }
    
}

struct DonersTable : Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("doners")
            .id()
            .field("firstname" , .string)
            .field("lastname" , .string)
            .field("phonenumber" , .int)
            .field("gender" , .string)
            .field("age" , .int)
            .field("bloodtype" , .string)
         //   .field("patient_id" , .uuid, .references("patients", "id"))

            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("doners")
            .delete()
    }
}
