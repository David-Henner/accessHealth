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

    var patient =  Patient(
        firstName: "Jean",
        lastName: "Bon",
        birthDate: "29/12/1994",
        id: "38276438",
        admissionMotives: "Il est tombé dans les escaliers après avoir bu 25 litres de bière et fumé 3 joints, il avait aussi ingéré des médicaments inconnus. Il s'était taillé les veines 2 fois et a mangé trois pommes la veille du jour du mariage de sa grand tante",
        antecedents: "aucuns frjfioahrgo apeufh arf aa^rijgra^g arôgjaepro garfihapirug aprugh areghapez fuharzifh aiorugh aoiurgapuzerfgh apzfhapufh apozfhaprghpaurgh",
        treatments: "aucuns azehf puazehf azpeifhazçpfhalrh apfh apurzfh apzrghpauifgh auifgazejfh aezpiufhaezpuifhaez pjfazeuifhapze fazephf azepofh aezofaezipfh aezufhaez",
        heartRate: "70",
        arterTension: "120 / 80",
        oxygenSat: "100 %",
        respRate: "13")

    
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
        
        if let id = self.id {
            print(id)
        }
        
        // Setting up the UI
            self.patientName.text = patient.firstName + " " + patient.lastName
            self.patientBirthdate.text = patient.birthDate
            self.patientID.text = patient.id
            self.heartRate.text = patient.heartRate
            self.arterTension.text = patient.arterTension
            self.oxygenSat.text = patient.oxygenSaturation
            self.respRate.text = patient.respRate
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embeddedDetails" {
            let detailsController = segue.destination as! DetailsTableViewController
            detailsController.patient = patient
        }
    }
 }
