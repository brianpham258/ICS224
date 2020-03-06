//
//  MasterViewController.swift
//  Lab4
//
//  Created by Brian Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import os

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var objects = [PhotoEntry]()
    var detailView = DetailViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem
        // load data at startup
        if let savedNotes = loadObjects() {
            objects += savedNotes // append saved data to objects array
        }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc func insertNewObject(_ sender: Any) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm a"
        objects.insert(PhotoEntry(photo: UIImage(named: "defaultImage")!, notes: "My notes", date: df.string(from: Date())), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        // save data after adding a new note
        saveObjects()
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        // save data after editing note or photo
        if(detailViewController?.textChanged == true || detailViewController?.photoChanged == true || detailViewController?.dateChanged == true) {
            saveObjects()
        }
        
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.entry = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
            tableView.reloadData()
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoEntryTableViewCell
        let object = objects[indexPath.row]

        cell.photoView.image = object.photo
        cell.notesView.text = object.notes

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // save data after delete a note
            saveObjects()
            
            // disable camera after deleting all tries
            if(objects.count == 0) {
                detailViewController?.isEntryEmpty = true
                detailViewController?.viewDidLoad()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    // MARK: - Load/Save
    func loadObjects() -> [PhotoEntry]? {
        do {
            // Try to load data from memory
            let data = try Data(contentsOf: PhotoEntry.archiveURL)
            // return photo as PhotoEntry array
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [PhotoEntry]
        } catch {
            // Catch any error then print to console
            os_log("Cannot load due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
            return nil
        }
    }
    
    func saveObjects() {
        do {
            // store data to variable data
            let data = try NSKeyedArchiver.archivedData(withRootObject: objects, requiringSecureCoding: false)
            // try to write data to a file
            try data.write(to: PhotoEntry.archiveURL)
        } catch {
            // catch any erro then print to console
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
}
