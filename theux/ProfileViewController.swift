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
    @IBOutlet weak var admissionLabel: UILabel!
    
    @IBOutlet weak var patientID: UILabel!
    @IBOutlet weak var patientBirthdate: UILabel!
    @IBOutlet weak var patientName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.admissionLabel.isHidden = true
    }
    
    @IBAction func ToggleAdmission(_ sender: AnyObject) {
        self.admissionLabel.isHidden = !self.admissionLabel.isHidden
    }

}
