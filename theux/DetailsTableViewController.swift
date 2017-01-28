//
//  DetailsTableViewController.swift
//  theux
//
//  Created by David Henner on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation
import UIKit

class DetailsTableViewController: UITableViewController {
    var patient : Patient?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let patient = patient {
            let viewController = segue.destination as! DetailViewController
            if segue.identifier == "motifSegue" {
                viewController.name = "Motif d'admission"
                viewController.text = patient.admissionMotives
            }
            else if segue.identifier == "treatmentSegue" {
                viewController.name = "Traitements en cours"
                viewController.text = patient.treatments
            }
            else if segue.identifier == "antecedentSegue" {
                viewController.name = "Antécédents"
                viewController.text = patient.antecedents
            }
        }
    }
}
