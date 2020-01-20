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
            countButton.isEnabled = true
        }
        else {
            countButton.isEnabled = false
        }
    }
    
    @IBAction func validateInput(_ sender: UITextField) {
        var stringInput = initialValueTextField.text!
        if (Int(initialValueTextField.text!) == nil) {
            initialValueTextField.text = "0";
        }
        if (stringInput.prefix(1) == "0") {
            stringInput.remove(at: stringInput.startIndex)
            initialValueTextField.text = stringInput
        }
        if (Int(stringInput) == Int.max) {
            initialValueTextField.text = "0"
        }
        if (Int(stringInput) == NSIntegerMax) {
            initialValueTextField.text = "0"
        }
    }
    
    @IBAction func increasePushCount(_ sender: UIButton) {
        initialValueTextField.resignFirstResponder()
        
        var currentCount = Int(countLabel.text!)
        if (Int(initialValueTextField.text!) != initialNum) {
            initialNum = Int(initialValueTextField.text!)
            currentCount = initialNum
        }
        let nextCount = (currentCount ?? 0) + 1
        countLabel.text = String(nextCount)
    }
}

