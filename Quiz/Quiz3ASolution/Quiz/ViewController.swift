//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 //   let digits = [Character("0") : 1, Character("1") : 1, Character("2") : 1, Character("3") : 1, Character("4") : 1, Character("5") : 1, Character("6") : 1, Character("7") : 1, Character("8") : 1, Character("9") : 1 ]

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
    
    @IBOutlet weak var digitLabel: UILabel!
    @IBOutlet weak var userText: UITextField!
    
    @IBAction func textEnter(_ sender: UITextField) {
        var counter = 0
        let userString = userText.text ?? ""
        let numString = "0123456789"
        
        for i in userString {
            for j in numString {
                if (i == j) {
                    counter += 1
                }
            }
        }
        
        digitLabel.text = "\(counter) digits"
    }
}

