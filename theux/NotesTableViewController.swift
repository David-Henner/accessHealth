//
//  NotesTableViewController.swift
//  theux
//
//  Created by Guillaume Wehrling on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    @IBOutlet weak var addNote: UIBarButtonItem!
    
    private var valuesDate = ["28/01/2017 13H10", "28/01/2017 13H30", "28/01/2017 15H10"]
    private var valuesDesc = ["Remplir avec 500mL de sérum physiologique isotonique 0,9%", "Donner une dose d'Amiklin", "J'ai monté la noradrénaline à 2 mL/h"]

    override func viewDidLoad() {
        super.viewDidLoad()

        addNote.target = self
        addNote.action = #selector(addNoteAction(sender:))
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NotesTableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return valuesDate.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell

        cell.dateHourLabel.text = valuesDate[indexPath.row]
        cell.noteField.text = valuesDesc[indexPath.row]
        
        return cell
    }
 
    func addNoteAction(sender: UIBarButtonItem?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        let currentDate = NSDate()
        
        valuesDate.append(dateFormatter.string(from:currentDate as Date))
        valuesDesc.append("taper pour ecrire")
        self.tableView.reloadData()
        

        self.tableView.scrollToRow(at: IndexPath.init(row: valuesDate.count - 1, section: 0), at: .bottom, animated: true)

    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        view.endEditing(true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
