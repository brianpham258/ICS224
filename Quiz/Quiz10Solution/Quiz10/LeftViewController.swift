//
//  LeftViewController.swift
//  Quiz10
//
//  Created by Michael Horie on 2020-03-27.
//  Copyright © 2020 ics000. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    var textToBeCopied: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = textToBeCopied
    }
}
