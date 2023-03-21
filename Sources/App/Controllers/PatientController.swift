//
//  PatientController.swift
//  
//
//  Created by Rand AlMuhanna on 29/08/1444 AH.
//

import Foundation
import Vapor


final class PatientController {
    
    
    // Post
    func create(_ req:Request) throws -> EventLoopFuture<Patient> {
    let Patient = try req.content.decode(Patient.self)
    return Patient.create(on: req.db).map{ Patient }
    }
    
    
    //Get All
    func all(req: Request) throws -> EventLoopFuture<[Patient]> {
        Patient.query(on: req.db).all()
        
    }
    
    // Get by Id
    func getId(req : Request) throws -> EventLoopFuture<Patient> {
        
        Patient.find(req.parameters.get("patientid") , on : req.db)
            .unwrap(or: Abort(.notFound))
        
    }
    // Update
    
    func update (req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
        let patient = try req.content.decode(Patient.self)
        
        return Patient.find(patient.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.firstname = patient.firstname
                $0.lastname = patient.lastname
                $0.bloodtype = patient.bloodtype
                $0.age = patient.age
                $0.bloodtype = patient.bloodtype
                
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
        Patient.find(req.parameters.get("patientid"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
            $0.delete(on: req.db)
            }.transform(to: .ok)

        
        
    }
    
}
