//
//  DonersController.swift
//  
//
//  Created by Rand AlMuhanna on 29/08/1444 AH.
//


import Foundation
import Vapor


final class DonersController {
//    
//    func boot(routes: RoutesBuilder) throws {
//        
//        let doner = routes.grouped("doners")
//        doner.get(use: all)
//        doner.post(use: create)
//        
//        doner.group(":donersid") { doner in
//            
//            doner.get(use : getId)
//            doner.put(use : update)
//            doner.delete(use : delete)
//
//            
//        }
//
//    }
    
    // Post
    func create(_ req:Request) throws -> EventLoopFuture<Doners> {
    let Doners = try req.content.decode(Doners.self)
    return Doners.create(on: req.db).map{ Doners }
    }
    
    
    //Get All
    func all(req: Request) throws -> EventLoopFuture<[Doners]> {
        Doners.query(on: req.db).all()
        
    }
    
    // Get by Id
    func getId(req : Request) throws -> EventLoopFuture<Doners> {
        
        Doners.find(req.parameters.get("donersid") , on : req.db)
            .unwrap(or: Abort(.notFound))
        
    }
    // Update
    
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
        let doners = try req.content.decode(Doners.self)
        
        return Doners.find(doners.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.firstname = doners.firstname
                $0.lastname = doners.lastname
                $0.bloodtype = doners.bloodtype
                $0.age = doners.age
                $0.bloodtype = doners.bloodtype
                
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
        Doners.find(req.parameters.get("donersid"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
            $0.delete(on: req.db)
            }.transform(to: .ok)

    }
    
}
