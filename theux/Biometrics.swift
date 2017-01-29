//
//  Biometrics.swift
//  theux
//
//  Created by David Henner on 29/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation

class Biometrics {
    var name : String
    var values : [Float]
    var unit: String
    
    init(name: String, values: [Float], unit: String) {
        self.name = name
        self.values = values
        self.unit = unit
    }
    
}
