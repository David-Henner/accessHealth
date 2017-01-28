//
//  Patient.swift
//  theux
//
//  Created by David Henner on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation

class Patient {
    var firstName : String
    var lastName : String
    var birthDate : String
    var id : String
    var admissionMotives : String
    var antecedents : String
    var treatments : String
    
    init(firstName: String, lastName: String, birthDate: String, id: String, admissionMotives: String, antecedents: String, treatments: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.id = id
        self.admissionMotives = admissionMotives
        self.antecedents = antecedents
        self.treatments = treatments
    }
}
