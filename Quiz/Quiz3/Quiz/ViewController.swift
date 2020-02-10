//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    ///
    /// For all user interface elements below, make sure they are centred regardless of device or orientation
    ///
    /// Question 1:
    /// Create a user interface that consists of the following elements:
    /// (a) an empty Text Field with Identifier "userText"
    /// (b) below that, a Label with Identifier "digitLabel"
    /// Whenever text is entered, the Label must list the number of digits in the Text Field.  For example, if the Text Field contains "123 Main Street", the Label must read "3 digits"
    ///
    /// Hint:
    /// Window > Developer Documentation can give you information to solve this problem.
    /// It even contains documentation on how to use the Array, Dictionary, and String classes.
    /// Just enter their class name in the search box
    ///
    

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var digitLabel: UILabel!
    
    @IBAction func digitCounter1(_ sender: Any) {
        let userInput = userText.text ?? ""
        let numString = "0123456789"
        var counter = 0
        
        for i in userInput {
            for j in numString {
                if (i == j) {
                    counter += 1
                }
            }
        }
        
        digitLabel.text = String(counter) + " digits"
    }
}

