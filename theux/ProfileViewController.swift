//
//  ProfileViewController.swift
//  theux
//
//  Created by David Henner on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    var id : Int?

    var patients : [Patient] = []
    
    // Patient info
    @IBOutlet weak var patientID: UILabel!
    @IBOutlet weak var patientBirthdate: UILabel!
    @IBOutlet weak var patientName: UILabel!
    @IBOutlet weak var heartRate: UILabel!
    @IBOutlet weak var arterTension: UILabel!
    @IBOutlet weak var oxygenSat: UILabel!
    @IBOutlet weak var respRate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populatePatients()
        
        if let id = self.id {
            print(id)
        }
        
        // Setting up the UI
        if let id = id {
            if patients.count < id {
                let patient = patients[id]
                self.patientName.text = patient.firstName + " " + patient.lastName
                self.patientBirthdate.text = patient.birthDate
                self.patientID.text = patient.id
                self.heartRate.text = patient.heartRate
                self.arterTension.text = patient.arterTension
                self.oxygenSat.text = patient.oxygenSaturation
                self.respRate.text = patient.respRate
            }
        }
    }
    
    func populatePatients() {
        var notes = [Notes]()
        notes += [Notes(date: "28/01/2017 13H10", writer: "Jeanne Landin", text: "Repiration paradoxale, hyperventilation, foyer de pneumopathie à l'oscultation")]
        notes += [Notes(date: "28/01/2017 13H30", writer: "Romain Petit", text: "FR = 29, fébrile à 38,9°C, sueurs")]
        notes += [Notes(date: "28/01/2017 15H10", writer: "Jeanne Landin", text: "Mise sous VNI, mise sous Augmentin")]
        patients += [Patient(
            firstName: "Caroline",
            lastName: "Meyer",
            birthDate: "04/10/1949",
            id: "38276438",
            admissionMotives: "Venue pour une décompensation de BCPO avec hypercapnie sur pneumopathie infectieuse à S. pneumoniae",
            antecedents: "Obésité morbide, Diabète insulino-requérant, insuffisance veineuse avec ulcère veineux de la jambe droite, SAOS",
            treatments: "",
            heartRate: "105",
            arterTension: "105/70",
            oxygenSat: "90%",
            respRate: "18",
            notes: notes)
        ]
        
        notes = []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embeddedDetails" {
            let detailsController = segue.destination as! DetailsTableViewController
            if let id = id {
                if patients.count < id {
                    detailsController.patient = patients[id]
                }
            }
        }
    }
 }
