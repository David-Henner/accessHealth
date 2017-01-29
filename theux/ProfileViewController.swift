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
    
    var detailsController : DetailsTableViewController?
    var notesController : NotesTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populatePatients()
        
        // Setting up the UI
        if let id = self.id {
            if patients.count >= id {
                let patient = patients[id-1]
                self.patientName.text = patient.firstName + " " + patient.lastName
                self.patientBirthdate.text = patient.birthDate
                self.patientID.text = patient.id
                self.heartRate.text = patient.heartRate
                self.arterTension.text = patient.arterTension
                self.oxygenSat.text = patient.oxygenSaturation
                self.respRate.text = patient.respRate
                self.detailsController?.patient = patient
                self.notesController?.notes = patient.notes
            }
        }
    }
    
    func populatePatients() {
        
        // Notes for patient 1
        var notes = [Notes]()
        notes += [Notes(date: "28/01/2017 13H10", writer: "Jeanne Landin", text: "Repiration paradoxal\nHyperventilation\nFoyer de pneumopathie à l'oscultation")]
        notes += [Notes(date: "28/01/2017 13H30", writer: "Romain Petit", text: "FR = 29\nFébrile à 38,9°C\nSueurs")]
        notes += [Notes(date: "28/01/2017 15H10", writer: "Jeanne Landin", text: "Mise sous VNI\nMise sous Augmentin")]
        
        // Biometrics for patient 1
        var biometrics = [Biometrics]()
        biometrics += [Biometrics(name:"Leucocytes", values: [13, 12, 11.8, 11.8], unit: "10^9/L")]
        biometrics += [Biometrics(name:"PNN", values: [85, 84, 82, 82], unit: "%")]
        biometrics += [Biometrics(name:"CRP", values: [200, 170, 105, 98], unit: "mg/L")]
        biometrics += [Biometrics(name:"Sat. O2", values: [89, 92, 92, 91], unit: "%")]
        biometrics += [Biometrics(name:"Pa O2", values: [80, 83, 85, 88], unit: "mmHg")]
        biometrics += [Biometrics(name:"Pa CO2", values: [60, 55, 45, 46], unit: "mmHg")]
        biometrics += [Biometrics(name:"Bicarbonates", values: [25, 28, 24, 24], unit: "mmol")]
            
        patients += [Patient(
            firstName: "Caroline",
            lastName: "Meyer",
            birthDate: "04/10/1949",
            id: "243908",
            admissionMotives: "Venue pour une décompensation de BCPO avec hypercapnie sur pneumopathie infectieuse à S. pneumoniae",
            antecedents: "Obésité morbide\nDiabète insulino-requérant\nInsuffisance veineuse avec ulcère veineux de la jambe droite\nSAOS",
            treatments: "Amlor 10 mg/j",
            heartRate: "105",
            arterTension: "105/70",
            oxygenSat: "90%",
            respRate: "18",
            notes: notes,
            biometrics: biometrics)
        ]
        
        
        // Notes for patient 2
        notes = []
        notes += [Notes(date: "26/01/2017 07H43", writer: "Dr Martin", text: "Appel chirurgiens pour avis ligatures varices oesophagiennes")]
        notes += [Notes(date: "26/01/2017 08H30", writer: "Romain Petit", text: "Remplissage par 500 mL solutés isotoniques 0,9%")]
        notes += [Notes(date: "26/01/2017 09H13", writer: "Romain Petit",text:"Commande 2 culots de GR\nMise sous Noradrénaline 1mg/h")]

        // Biometrics for patient 2
        biometrics = []
        biometrics += [Biometrics(name:"Hb", values: [8, 8, 8.9, 10], unit: "g/dL")]
        biometrics += [Biometrics(name:"Hf", values: [38, 38, 40, 41], unit: "%")]
        biometrics += [Biometrics(name:"TP", values: [45, 45, 45, 45], unit: "%")]
        biometrics += [Biometrics(name:"ASAT", values: [60, 58, 56, 52], unit: "uI/L")]
        biometrics += [Biometrics(name:"ALAT", values: [57, 56, 50, 49], unit: "uI/L")]
        biometrics += [Biometrics(name:"PAL", values: [115, 110, 108, 108], unit: "uI/L")]
        biometrics += [Biometrics(name:"Gly", values: [1.56, 1.6, 1.48, 1.4], unit: "g/L")]

        patients += [Patient(
            firstName: "Richard",
            lastName: "Pisardi",
            birthDate: "26/09/1958",
            id: "100607",
            admissionMotives: "Admis pour hématémèse",
            antecedents: "Hépatite B (A2F1) chronique connue traitée par ténofovir\nVarices oesophagiennes grade II\nEczema",
            treatments: "Propanolol 80 mg/j\nTénofovir\nRégime hyposodé",
            heartRate: "120",
            arterTension: "80/50",
            oxygenSat: "97%",
            respRate: "20",
            notes: notes,
            biometrics: biometrics)
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embeddedDetails" {
            detailsController = segue.destination as? DetailsTableViewController
        }
        if segue.identifier == "showNotes" {
            notesController = segue.destination as? NotesTableViewController
            if let id = self.id {
                if patients.count >= id {
                    notesController?.notes = patients[id-1].notes
                }
            }
        }
        if segue.identifier == "showBio" {
            let biometricsController = segue.destination as? BiometricsTableViewController
            if let id = self.id {
                if patients.count >= id {
                    biometricsController?.biometrics = patients[id-1].biometrics
                }
            }
        }
    }
 }
