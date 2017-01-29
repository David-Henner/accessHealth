//
//  BiometricsTableViewController.swift
//  theux
//
//  Created by David Henner on 29/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import Foundation
import UIKit

class BiometricsTableViewController: UITableViewController {
    var biometrics = [Biometrics]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = tableView.dequeueReusableCell(withIdentifier: "bHeaderCell")
        self.tableView.tableHeaderView = cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return biometrics.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bHeaderCell")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "biometricsCell", for: indexPath) as! BiometricsTableViewCell
        
        let metric = biometrics[indexPath.row]
        
        cell.metricTitle.text = metric.name + " (" + metric.unit + ")"
        cell.value1.text = String(metric.values[0])
        cell.value2.text = String(metric.values[1])
        cell.value3.text = String(metric.values[2])
        cell.value4.text = String(metric.values[3])

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "") {
            let graphController = segue.destination as! ChartsViewController
            if let index = tableView.indexPathForSelectedRow?.row {
                graphController.bio = biometrics[index]
            }
        }
    }

}
