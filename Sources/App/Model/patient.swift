//
//  patenit.swift
//  
//
//  Created by Rand AlMuhanna on 24/08/1444 AH.
//

import Foundation
import Vapor
import FluentKit
import FluentPostgresDriver

// content protocol فيها انكود وديكود وتتناسب مع الفيبر
final class Patient: Content , Model {
    
    
    static let schema = "patient"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "firstname")
    var firstname : String
    
    @Field(key: "lastname")
    var lastname : String
    
    @Field(key: "phonenumber")
    var phonenumber : Int
    
    @Field(key: "gender")
    var gender : String
    
    @Field(key: "age")
    var age : Int
    
    @Field(key: "bloodtype")
    var bloodtype : String
    
    @Children(for: \.$patient)
    var donoers:[Doners]
    
    
    init() {}
    
    init(id: UUID? = nil , firstname : String , lastname : String , phonenumber : Int , gender : String , age : Int , bloodtype : String ) {
        
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.phonenumber = phonenumber
        self.gender = gender
        self.age = age
        self.bloodtype = bloodtype
        
    }
}
