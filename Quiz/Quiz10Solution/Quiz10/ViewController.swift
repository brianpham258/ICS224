//
//  ViewController.swift
//  Quiz10
//
//  Created by Michael Horie on 2020-03-27.
//  Copyright © 2020 ics000. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textToBeCopied: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLeft" {
            if let controller = (segue.destination as! UINavigationController).topViewController as? LeftViewController {
                controller.textToBeCopied = textToBeCopied.text
            }
        }
        else if segue.identifier == "goRight" {
            // Alternative solution: Save a reference to the RightViewController here, and set this reference to nil at the top of prepare
        }
    }

    @IBAction func unwindFromViewController(sender: UIStoryboardSegue?) {
        // Alternative solution: Using the reference to the RightViewController, access the String in the RightViewController here
        if let controller = sender?.source as? RightViewController {
            label.text = controller.textField.text
        }
    }

}

