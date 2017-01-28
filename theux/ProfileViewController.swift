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

    var patient : Patient?
    
    // Stack view labels

    @IBOutlet weak var admissionLabel: UILabel!
    @IBOutlet weak var antecedentsLabel: UILabel!
    @IBOutlet weak var treatmentsLabel: UILabel!
    
    // Patient info
    @IBOutlet weak var patientID: UILabel!
    @IBOutlet weak var patientBirthdate: UILabel!
    @IBOutlet weak var patientName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = self.id {
            print(id)
        }
        
        patient = Patient(
            firstName: "Jean",
            lastName: "Bon",
            birthDate: "29/12/1994",
            id: "38276438",
            admissionMotives: "Il est tombé dans les escaliers après avoir bu 25 litres de bière et fumé 3 joints, il avait aussi ingéré des médicaments inconnus. Il s'était taillé les veines 2 fois et a mangé trois pommes la veille du jour du mariage de sa grand tante",
            antecedents: "aucuns frjfioahrgo apeufh arf aa^rijgra^g arôgjaepro garfihapirug aprugh areghapez fuharzifh aiorugh aoiurgapuzerfgh apzfhapufh apozfhaprghpaurgh",
            treatments: "aucuns azehf puazehf azpeifhazçpfhalrh apfh apurzfh apzrghpauifgh auifgazejfh aezpiufhaezpuifhaez pjfazeuifhapze fazephf azepofh aezofaezipfh aezufhaez")
        
        // Setting up stack view labels
        self.admissionLabel.isHidden = true

        self.antecedentsLabel.isHidden = true
        self.treatmentsLabel.isHidden = true
        
        // Setting up the UI
        if let patient = self.patient {
            self.patientName.text = patient.firstName + " " + patient.lastName
            self.patientBirthdate.text = patient.birthDate
            self.patientID.text = patient.id
            self.admissionLabel.text = patient.admissionMotives
            self.antecedentsLabel.text = patient.antecedents
            self.treatmentsLabel.text = patient.treatments
        }
    }
    
    @IBAction func ToggleAdmission(_ sender: AnyObject) {
        self.admissionLabel.isHidden = !self.admissionLabel.isHidden
    }

    @IBAction func ToggleAntecedents(_ sender: AnyObject) {
        self.antecedentsLabel.isHidden = !self.antecedentsLabel.isHidden
    }
    
    @IBAction func ToggleTreatments(_ sender: AnyObject) {
        self.treatmentsLabel.isHidden = !self.treatmentsLabel.isHidden
    }
}
