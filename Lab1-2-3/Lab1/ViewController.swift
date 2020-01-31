//
//  ViewController.swift
//  Lab1
//
//  Created by QuangPham on 2020-01-12.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var initialNum: Int? = 0
    var nextCount: Int = 0
    
    // MARK: Properties
    @IBOutlet weak var countSwitch: UISwitch!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var initialValueTextField: UITextField!
    // MARK: Delegate Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: Actions
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            countButton.isEnabled = true // enable the Push button
        }
        else {
            countButton.isEnabled = false // disable the Push button
        }
    }
    
    // Check user input
    @IBAction func validateInput(_ sender: UITextField) {
        var stringInput = initialValueTextField.text!   // get the text form of the user input
        if (Int(initialValueTextField.text!) == nil) {  // if user input nothing then set it to 0
            initialValueTextField.text = "0";
        }
        if (stringInput.prefix(1) == "0") {     // if user input start with 0 then remove the 0
            stringInput.remove(at: stringInput.startIndex)
            initialValueTextField.text = stringInput
        }
        if (Int(stringInput) == Int.max) {      // if user input max int then set it to 0
            initialValueTextField.text = "0"
        }
        if (Int(stringInput) == NSIntegerMax) { // if user input NSIntergerMax then set it to 0
            initialValueTextField.text = "0"
        }
    }
    
    // Increase the number in the label
    @IBAction func increasePushCount(_ sender: UIButton) {
        initialValueTextField.resignFirstResponder()
        
        var currentCount = Int(countLabel.text!)    // get the text form of the countLabel variable
        if (Int(initialValueTextField.text!) != initialNum) {   // If number in countLabel is different
            initialNum = Int(initialValueTextField.text!)       // with the user input, then the currentCount
            currentCount = initialNum                           // is set the number that user input
        }
        nextCount = (currentCount ?? 0) + 1     // increase the number
        countLabel.text = String(nextCount)         // display the number
    }
}

