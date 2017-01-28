//
//  DetailViewController.swift
//  theux
//
//  Created by David Henner on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var text : String?
    var name : String?
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        detailLabel.text = text
        titleLabel.text = name
    }
}
