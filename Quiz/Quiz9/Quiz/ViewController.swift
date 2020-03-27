//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit
import os


///
/// For this quiz, there are 7 levels.  Do not panic.  There is NOT enough time to complete all 7 levels, i.e., it is possible to get a 100% even if you do NOT complete all 7 levels.
///
/// Modify Main.storyboard and ViewController.swift  so that:
/// (1) The main storyboard contains a UIPickerView, a UITextField, and two UIButtons, the left button being named "Add" or "+", and the right button being named "Remove" or "-".
/// The interface layout must be usable, but don't lose time in getting it to look pretty.
/// (2) Connect the four UI elements in (1) to IBOutlets in the ViewController
/// (3) Commit your work.  You have reached level 1
/// (4) Create a pickerData array consisting of the Strings "A", "B", "C", "D"
/// (5) Implement picker delegates so that the current picker selection is reflected in the UITextField
/// (6) Make sure the contents of picker row 0 is displayed when the ViewController is first loaded
/// (7) Commit your work.  You have reached level 2.  Assuming there are no bugs, reaching this level means your score will be at least 5/10
/// (8) Link a UITextField action to the ViewController so that any time a character is added, modified, or removed, the result is immediately displayed in the picker
/// (9) Commit your work.  You have reached level 3.  Assuming there are no bugs, reaching this level means your score will be at least 7/10
/// (10) Change the contents of the picker array to be initially an empty array of Strings
/// (11) Link the "Add" button to an IBAction in the ViewController
/// (12) Every time the "Add" button is tapped, a new entry must be inserted (not appended) at the current position using pickerData.insert(...).  See Add.mov in the Quiz folder
/// for an example session
/// (13) Commit your work.  You have reached level 4
/// (14)Every time the "Remove" button is tapped, the current row is deleted using pickerData.remove(...) and the previous element in the picker is selected using
/// picker.selectRow(...). See Remove.mov in the Quiz folder for an example session.  With remove, there are lots of cases where arrays will go out of bounds; be sure to find
/// and fix all crashes
/// (15) Commit your work.  You have reached level 5
/// (16) Fix the "Remove" button so that it becomes disabled if there are no more rows left to delete
/// (17) Commit your work.  You have reached level 6
/// (18) Review and clean up your code
/// (19) Commit your work.  You have reached level 7
///

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    var pickerData = [String]()
    var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = pickerData[row]
        currentRow = row
        print(currentRow)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        pickerData[currentRow] = textField.text ?? "N/A"
        picker.reloadAllComponents()
    }
    
    @IBAction func addTitle(_ sender: UIButton) {
        pickerData.insert("Untitled", at: currentRow)
        textField.text = pickerData[currentRow]
        picker.reloadAllComponents()
    }
    
    @IBAction func removeTitle(_ sender: UIButton) {
        pickerData.remove(at: currentRow)
        currentRow -= 1
        (currentRow < 0) ? (currentRow = 0) : (currentRow = currentRow)
        picker.selectedRow(inComponent: currentRow)
        textField.text = pickerData[currentRow]
        picker.reloadAllComponents()
    }
}
