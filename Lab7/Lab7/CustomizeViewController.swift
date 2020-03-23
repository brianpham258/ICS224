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
    
    static var style1 = [false, false, false]           // Created 4 arrays to store the style of buttons in 4 pickers
    static var style2 = [false, false, false]           // The position of the flags are Bold, Italics, Underline respectively
    static var style3 = [false, false, false]           // If a Bold or Italics or Underline button is pressed, set true
    static var style4 = [false, false, false]           // If a Bold or Italics or Underline button is pressed again, set false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number component of the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number element of the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentRow = row
        
        // Check for previous style
        switch currentRow {
        case 0:     // Check for previous style settings of picker 1
            CustomizeViewController.style1[0] ? boldButton.setTitleColor(UIColor.red, for: .normal) : boldButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style1[1] ? italicsButton.setTitleColor(UIColor.red, for: .normal) : italicsButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style1[2] ? underlineButton.setTitleColor(UIColor.red, for: .normal) : underlineButton.setTitleColor(UIColor.blue, for: .normal)
            break
        
        case 1:     // Check for previous style settings of picker 2
            CustomizeViewController.style2[0] ? boldButton.setTitleColor(UIColor.red, for: .normal) : boldButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style2[1] ? italicsButton.setTitleColor(UIColor.red, for: .normal) : italicsButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style2[2] ? underlineButton.setTitleColor(UIColor.red, for: .normal) : underlineButton.setTitleColor(UIColor.blue, for: .normal)
            break
        
        case 2:     // Check for previous style settings of picker 3
            CustomizeViewController.style3[0] ? boldButton.setTitleColor(UIColor.red, for: .normal) : boldButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style3[1] ? italicsButton.setTitleColor(UIColor.red, for: .normal) : italicsButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style3[2] ? underlineButton.setTitleColor(UIColor.red, for: .normal) : underlineButton.setTitleColor(UIColor.blue, for: .normal)
            break
        
        case 3:     // Check for previous style settings of picker 4
            CustomizeViewController.style4[0] ? boldButton.setTitleColor(UIColor.red, for: .normal) : boldButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style4[1] ? italicsButton.setTitleColor(UIColor.red, for: .normal) : italicsButton.setTitleColor(UIColor.blue, for: .normal)
            CustomizeViewController.style4[2] ? underlineButton.setTitleColor(UIColor.red, for: .normal) : underlineButton.setTitleColor(UIColor.blue, for: .normal)
            break
        default:
            break
        }
        
        return pickerData[row]
    }
    
    // Change the name of the picker
    @IBAction func changeName(_ sender: UITextField) {
        pickerData[currentRow] = buttonLabel.text ?? ""
        viewDidLoad()
    }

    // Bold button
    @IBAction func boldButton(_ sender: UIButton) {
        // Check which picker is currently picked and set the Bold flag
        switch currentRow {
        case 0:
            // Change button color to red or blue for picker 1
            if !CustomizeViewController.style1[0] {
                boldButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style1[0] = true
            }
            else {
                boldButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style1[0] = false
            }
            
            break
        case 1:
            // Change button color to red or blue for picker 2
            if !CustomizeViewController.style2[0] {
                boldButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style2[0] = true
            }
            else {
                boldButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style2[0] = false
            }
            
            break
        case 2:
            // Change button color to red or blue for picker 3
            if !CustomizeViewController.style3[0] {
                boldButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style3[0] = true
            }
            else {
                boldButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style3[0] = false
            }
            
            break
        case 3:
            // Change button color to red or blue for picker 4
            if !CustomizeViewController.style4[0] {
                boldButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style4[0] = true
            }
            else {
                boldButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style4[0] = false
            }
            
            break
        default:
            break
        }
        delegate.didStyleChange(style1: CustomizeViewController.style1, style2: CustomizeViewController.style2, style3: CustomizeViewController.style3, style4: CustomizeViewController.style4)
    }
    
    // Italics Button
    @IBAction func italicsButton(_ sender: UIButton) {
        // Check which picker is currently picked and set the Italics flag
        switch currentRow {
        case 0:
            // Change button color to red or blue for picker 1
            if !CustomizeViewController.style1[1] {
                italicsButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style1[1] = true
            }
            else {
                italicsButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style1[1] = false
            }
            
            break
        case 1:
            // Change button color to red or blue for picker 2
            if !CustomizeViewController.style2[1] {
                italicsButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style2[1] = true
            }
            else {
                italicsButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style2[1] = false
            }
            
            break
        case 2:
            // Change button color to red or blue for picker 3
            if !CustomizeViewController.style3[1] {
                italicsButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style3[1] = true
            }
            else {
                italicsButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style3[1] = false
            }
            
            break
        case 3:
            // Change button color to red or blue for picker 4
            if !CustomizeViewController.style4[1] {
                italicsButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style4[1] = true
            }
            else {
                italicsButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style4[1] = false
            }
            
            break
        default:
            break
        }
        delegate.didStyleChange(style1: CustomizeViewController.style1, style2: CustomizeViewController.style2, style3: CustomizeViewController.style3, style4: CustomizeViewController.style4)
    }
    
    // Underline button
    @IBAction func underlineButton(_ sender: UIButton) {
        // Check which picker is currently picked and set the Underline flag
        switch currentRow {
        case 0:
            // Change button color to red or blue for picker 1
            if !CustomizeViewController.style1[2] {
                underlineButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style1[2] = true
            }
            else {
                underlineButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style1[2] = false
            }
            
            break
        case 1:
            // Change button color to red or blue for picker 2
            if !CustomizeViewController.style2[2] {
                underlineButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style2[2] = true
            }
            else {
                underlineButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style2[2] = false
            }
            
            break
        case 2:
            // Change button color to red or blue for picker 3
            if !CustomizeViewController.style3[2] {
                underlineButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style3[2] = true
            }
            else {
                underlineButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style3[2] = false
            }
            
            break
        case 3:
            // Change button color to red or blue for picker 4
            if !CustomizeViewController.style4[2] {
                underlineButton.setTitleColor(UIColor.red, for: .normal)
                CustomizeViewController.style4[2] = true
            }
            else {
                underlineButton.setTitleColor(UIColor.blue, for: .normal)
                CustomizeViewController.style4[2] = false
            }
            
            break
        default:
            break
        }
        delegate.didStyleChange(style1: CustomizeViewController.style1, style2: CustomizeViewController.style2, style3: CustomizeViewController.style3, style4: CustomizeViewController.style4)
    }
}
