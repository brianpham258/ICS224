//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerData = [String]()
    var currentRow = 0
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        textField.text = pickerData.first // short-hand for pickerData.count == 0 ? nil : pickerData[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerData.count == 0 {
            removeButton.isEnabled = false
            textField.text = ""
            textField.isEnabled = false
        }
        else {
            removeButton.isEnabled = true
            textField.isEnabled = true
        }

        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerData.count <= row {
            return ""
        }

        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData.count <= row {
            return
        }
        
        textField.text = pickerData[row]
        currentRow = row
    }
    
    @IBAction func updateRow(_ sender: Any) {
        if pickerData.count <= currentRow {
            return
        }
        
        pickerData[currentRow] = textField.text ?? ""
        picker.reloadAllComponents()
    }
    
    @IBAction func addRow(_ sender: Any) {
        if pickerData.count < currentRow {
            return
        }

        let newString = "Untitled"
        pickerData.insert(newString, at: currentRow)
        picker.reloadAllComponents()
        picker.selectRow(currentRow, inComponent: 0, animated: true)
        textField.text = newString
    }
    
    @IBAction func removeRow(_ sender: Any) {
        if pickerData.count <= currentRow {
            return
        }
        
        pickerData.remove(at: currentRow)
        picker.reloadAllComponents()
        if pickerData.count == 0 {
            return
        }
        
        currentRow = currentRow - 1
        if currentRow < 0 {
            currentRow = 0
        }
        picker.selectRow(currentRow, inComponent: 0, animated: true)
        textField.text = pickerData[currentRow]
    }
    
}
