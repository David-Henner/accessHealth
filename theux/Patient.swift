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
    var heartRate : String
    var arterTension : String
    var oxygenSaturation : String
    var respRate : String
    var notes: [Notes]
    
    init(firstName: String, lastName: String, birthDate: String, id: String, admissionMotives: String, antecedents: String, treatments: String, heartRate: String, arterTension: String, oxygenSat: String, respRate: String, notes: [Notes]) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.id = id
        self.admissionMotives = admissionMotives
        self.antecedents = antecedents
        self.treatments = treatments
        self.heartRate = heartRate
        self.arterTension = arterTension
        self.oxygenSaturation = oxygenSat
        self.respRate = respRate
        self.notes = notes
    }
}
