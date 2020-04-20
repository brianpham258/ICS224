//
//  ViewController.swift
//  Final
//
//  Created by Brian Pham on 2020-04-17.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelView: UILabel!
    var counter = 0
    var previousReact = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.delegate = self
        labelView.text = String(counter)
    }
    
    // Level 1
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier != "ShowController" {
            return
        }
    }
    
    @IBAction func unwindFromViewController(sender: UIStoryboardSegue?) {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let newString = textView.text ?? ""
        
        if ((newString.range(of: "\n")) != nil) {
           
            counter += 1
            labelView.text = String(counter)
        }
    }
}

