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

    let archiveURL = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Quiz6")

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var filterField: UITextField!
    @IBOutlet weak var outputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func processChange(_ sender: Any) {
        // Using closures
        outputField.text = inputField.text?.filter({ ( !(filterField.text?.contains($0) ?? false))})
        
        // Avoiding closures
//        var filterDict = [Character: Bool]()
//        for char in filterField.text ?? "" {
//            filterDict[char] = true
//        }
//        var output = ""
//        for char in inputField.text ?? "" {
//            if filterDict[char] == nil {
//                output.append(String(char))
//            }
//        }
//        outputField.text = output
    }
    
    @IBAction func save(_ sender: Any) {
        let state = [inputField.text, filterField.text, outputField.text]
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: state, requiringSecureCoding: false) else {
            os_log("Failed to save")
            return
        }
        try? data.write(to: archiveURL)
    }
    
    @IBAction func load(_ sender: Any) {
        guard let data = try? Data(contentsOf: archiveURL), let state = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String?] else {
            os_log("Failed to load")
            return
        }

        if state.count == 3 {
            inputField.text = state[0]
            filterField.text = state[1]
            outputField.text = state[2]
        }
    }
    
}
