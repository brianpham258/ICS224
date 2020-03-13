//
//  CustomizeViewController.swift
//  Lab7
//
//  Created by Brian Pham on 2020-03-06.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import Foundation

protocol CustomizeDelegate {
    func didStyleChange(style1: [Bool], style2: [Bool], style3: [Bool], style4: [Bool])
}

class CustomizeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonLabel: UITextField!
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var italicsButton: UIButton!
    @IBOutlet weak var underlineButton: UIButton!
    
    var delegate: CustomizeDelegate!
    var pickerData = [String]()
    var currentRow: Int = 0
    var style1 = [false, false, false]
    var style2 = [false, false, false]
    var style3 = [false, false, false]
    var style4 = [false, false, false]
    var isBoldRed = false
    var isItalicsRed = false
    var isUnderlineRed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number of column of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of row of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentRow = row
        // Set all button back to blue when changing the picker
        isBoldRed = false
        isItalicsRed = false
        isUnderlineRed = false
        boldButton.setTitleColor(UIColor.blue, for: .normal)
        italicsButton.setTitleColor(UIColor.blue, for: .normal)
        underlineButton.setTitleColor(UIColor.blue, for: .normal)
        
        return pickerData[row]
    }
    
    // Change the name of the picker
    @IBAction func changeName(_ sender: UITextField) {
        pickerData[currentRow] = buttonLabel.text ?? ""
        viewDidLoad()
    }

    // Bold button
    @IBAction func boldButton(_ sender: UIButton) {
        // Change button color to red
        if !isBoldRed {
            boldButton.setTitleColor(UIColor.red, for: .normal)
            isBoldRed = true
        }
        else {
            boldButton.setTitleColor(UIColor.blue, for: .normal)
        }
        
        // Check which picker is currently picked and set the Bold flag
        switch currentRow {
        case 0:
            style1[0] = true
            break
        case 1:
            style2[0] = true
            break
        case 2:
            style3[0] = true
            break
        case 3:
            style4[0] = true
            break
        default:
            break
        }
        delegate.didStyleChange(style1: style1, style2: style2, style3: style3, style4: style4)
    }
    
    // Italics Button
    @IBAction func italicsButton(_ sender: UIButton) {
        // Change button color to red
        if !isItalicsRed {
            italicsButton.setTitleColor(UIColor.red, for: .normal)
            isItalicsRed = true
        }
        else {
            italicsButton.setTitleColor(UIColor.blue, for: .normal)
        }
        
        // Check which picker is currently picked and set the Italics flag
        switch currentRow {
        case 0:
            style1[1] = true
            break
        case 1:
            style2[1] = true
            break
        case 2:
            style3[1] = true
            break
        case 3:
            style4[1] = true
            break
        default:
            break
        }
        delegate.didStyleChange(style1: style1, style2: style2, style3: style3, style4: style4)
    }
    
    // Underline button
    @IBAction func underlineButton(_ sender: UIButton) {
        // Change button color to red
        if !isUnderlineRed {
            underlineButton.setTitleColor(UIColor.red, for: .normal)
            isUnderlineRed = true
        }
        else {
            underlineButton.setTitleColor(UIColor.blue, for: .normal)
        }
        
        // Check which picker is currently picked and set the Underline flag
        switch currentRow {
        case 0:
            style1[2] = true
            break
        case 1:
            style2[2] = true
            break
        case 2:
            style3[2] = true
            break
        case 3:
            style4[2] = true
            break
        default:
            break
        }
        delegate.didStyleChange(style1: style1, style2: style2, style3: style3, style4: style4)
    }
}
