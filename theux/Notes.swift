//
//  Notes.swift
//  theux
//
//  Created by David Henner on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation

class Notes {
    var date: String
    var writer: String
    var text: String
    
    init(date : String, writer: String, text: String) {
        self.date = date
        self.writer = writer
        self.text = text
    }
}
