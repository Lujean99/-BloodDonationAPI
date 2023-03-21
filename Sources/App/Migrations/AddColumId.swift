//
//  File.swift
//  
//
//  Created by Rand AlMuhanna on 29/08/1444 AH.
//


import Foundation
import Fluent
import FluentPostgresDriver

struct AddColumId : Migration {
func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
database.schema("doners")
        .field("patient_id" , .uuid, .references("patient", "id"))
        .update()
}

func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
    database.schema("doners")
        .deleteField("patient_id")
        .delete()
}
}
