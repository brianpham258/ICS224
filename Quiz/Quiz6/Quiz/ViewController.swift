//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit
import os

//
// (1) Modify Main.storyboard and ViewController.swift so that the output field displays the contents of the input field,
// except for characters listed in the filter field; the latter characters must be removed from the output field.  For
// example, if the output field contains "Hello World" and the filter field contains "lWeH", the output field must contain
// "o ord"
//
// (2) Pressing the save button saves the text in the 3 text fields to the file with name Quiz6
// Note that you can archive an array using NSKeyedArchiver.archivedData()
//
// (3) Pressing the load button loads the text from the file named Quiz6 into the 3 text fields
// Note that you can unarchive an array using NSKeyedUnarchiver.unarchiveTopLevelObjectWithData()
//

class ViewController: UIViewController {
    // MARK: Properties
    let archiveURL = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Quiz6")
    var savedText = [String]()
    var loadedText = [String]()
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var filterField: UITextField!
    @IBOutlet weak var outputField: UITextField!
    
    // MARK: Delegate Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIButton) {
        savedText = [inputField.text!, filterField.text!, outputField.text!]
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: savedText, requiringSecureCoding: false) else {
            return
        }
        
        do {
            try data.write(to: archiveURL)
        }
        catch {
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
    @IBAction func load(_ sender: UIButton) {
        guard let data = try? Data(contentsOf: archiveURL) else {
            return
        }
        do {
            loadedText = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [String]
        }
        catch {
            return
        }
        
        inputField.text = loadedText[0]
        filterField.text = loadedText[1]
        outputField.text = loadedText[2]
    }
    
    @IBAction func input(_ sender: UITextField) {
        outputField.text = inputField.text
    }
    
    @IBAction func filter(_ sender: UITextField) {
        var newString: String = ""
        
        for i in inputField.text ?? ""{
            var counter = 0
            for j in filterField.text ?? "" {
                if (j != i) {
                    counter += 1
                }
            }
            if counter == (filterField.text ?? "").count {
                newString += String(i)
            }
        }
        
        outputField.text = newString
    }
}
