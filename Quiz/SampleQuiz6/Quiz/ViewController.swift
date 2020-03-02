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
// (1) Create a user interface with an empty text view, an empty text field, and 3 buttons
// with labels Filter, Save, and Load (see ScreenShot.png for the exact layout).
//
// (2) In the main storyboard, make sure the Accessibility Identifiers of the UI elements are set to
// textView, fileNameField, filterButton, saveButton, and loadButton, respectively.
//
// (3) Pressing the filter button filters out any non-letters, digits, and white spaces
// (Hint: isWhitespace) in the text view
//
// (4) Pressing the save button saves the text in the Documents directory using the file name
// in the text field.  If the text field does not contain a sequence of letters and digits, the
// save button must be disabled.  This is based on Lab 5.
//
// (5)) Pressing the load button loads the text from the Documents directory using the file name
// in the text field.  If the text field does not contain a sequence of letters and digits, the
// save button must be disabled.  This is based on Lab 5.
//

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var fileNameField: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    
    let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    // MARK: Delegate functions
    override func viewDidLoad() {
        super.viewDidLoad()
        if(fileNameField.text! == "") {
            saveButton.isEnabled = false
            loadButton.isEnabled = false
        }
    }
    
    @IBAction func buttonUpdate(_ sender: UITextField) {
        if(fileNameField.text! == "") {
            saveButton.isEnabled = false
            loadButton.isEnabled = false
        }
        else {
            saveButton.isEnabled = true
            loadButton.isEnabled = true
        }
    }
    
    @IBAction func filter(_ sender: UIButton) {
        if let newString = textView.text {
            textView.text = newString.filter{
                $0.isLetter || $0.isWhitespace || $0.isNumber
            }
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        let archiveURL = documentsDirectory.appendingPathComponent(fileNameField.text!)
        guard let text = textView.text, let data = try? NSKeyedArchiver.archivedData(withRootObject: text, requiringSecureCoding: false) else {
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
        let archiveURL = documentsDirectory.appendingPathComponent(fileNameField.text!)
        guard let data = try? Data(contentsOf: archiveURL), let text = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? String else {
            return
        }
        
        textView.text = text
    }
}
