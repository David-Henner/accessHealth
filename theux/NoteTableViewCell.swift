//
//  NoteTableViewCell.swift
//  theux
//
//  Created by Guillaume Wehrling on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var dateHourLabel: UILabel!
    @IBOutlet weak var noteField: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
