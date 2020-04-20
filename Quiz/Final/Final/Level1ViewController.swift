//
//  Level1ViewController.swift
//  Final
//
//  Created by Brian Pham on 2020-04-17.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class Level1ViewController: UIViewController {
    @IBOutlet weak var siwtch: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func switchLabel(_ sender: UISwitch) {
        if(sender.isOn) {
            label.text = "ON"
        }
        else {
            label.text = "OFF"
        }
    }
}
