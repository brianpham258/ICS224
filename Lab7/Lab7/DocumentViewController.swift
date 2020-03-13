//
//  DocumentViewController.swift
//  Lab7
//
//  Created by Brian Pham on 2020-03-06.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

extension DocumentViewController: CustomizeDelegate {
    func didStyleChange(style1: [Bool], style2: [Bool], style3: [Bool], style4: [Bool]) {
        self.style1 = style1
        self.style2 = style2
        self.style3 = style3
        self.style4 = style4
    }
}

class DocumentViewController: UIViewController {
    @IBOutlet weak var documentNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var document: Document?
    var buttonNames = ["Style 1", "Style 2", "Style 3", "Style 4"]
    var style1 = [false, false, false]
    var style2 = [false, false, false]
    var style3 = [false, false, false]
    var style4 = [false, false, false]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
                self.textView.attributedText = self.document?.text
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier != "ShowController" {
            return
        }
        guard let customizeViewController = segue.destination.children[0] as? CustomizeViewController else {
            fatalError("Unexpected destination \(segue.destination)")
        }
        customizeViewController.pickerData = buttonNames
        customizeViewController.delegate = self as CustomizeDelegate
    }
    
    @IBAction func unwindToDocumentViewController(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CustomizeViewController {
            buttonNames = sourceViewController.pickerData
            setButton(buttons: sourceViewController.pickerData)
        }
    }
    
    // Set the new button name
    func setButton(buttons: [String]) {
        button1.setTitle(buttons[0], for: .normal)
        button2.setTitle(buttons[1], for: .normal)
        button3.setTitle(buttons[2], for: .normal)
        button4.setTitle(buttons[3], for: .normal)
    }
    
    @IBAction func dismissDocumentViewController() {
        if document?.text != textView.attributedText {
            document?.text = textView.attributedText
            document?.updateChangeCount(.done)
        }
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    
    // Button style1
    @IBAction func style1(_ sender: UIButton) {
        let selectedString = textView.text as NSString
        let attributedString = NSMutableAttributedString(string: selectedString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0)])
        
        // Set bold, italics, and underline
        if(style1[0] && style1[1] && style1[2]) {
            let newFont = UIFont(name: "Arial-BoldItalicMT", size: 15.0)
            attributedString.addAttribute(NSAttributedString.Key.font, value: newFont as Any, range: textView.selectedRange)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
            underlineText(attributedString: attributedString)
            boldItalicFont(attributedString: attributedString)
        }
        // Set bold and italics
        else if (style1[0] && style1[1]) {
            boldItalicFont(attributedString: attributedString)
        }
        else {
            if style1[0] {
                // set bold
                textView.attributedText = boldText(attributedString: attributedString)
            }
            if style1[1] {
                // set italics
                textView.attributedText = italicsText(attributedString: attributedString)
            }
            if style1[2] {
                // set underline
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
                underlineText(attributedString: attributedString)
            }
        }
    }
    
    // Button style2
    @IBAction func style2(_ sender: UIButton) {
        let selectedString = textView.text as NSString
        let attributedString = NSMutableAttributedString(string: selectedString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0)])
        
        // Set bold, italics, and underline
        if(style2[0] && style2[1] && style2[2]) {
            let newFont = UIFont(name: "Arial-BoldItalicMT", size: 15.0)
            attributedString.addAttribute(NSAttributedString.Key.font, value: newFont as Any, range: textView.selectedRange)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
            underlineText(attributedString: attributedString)
            boldItalicFont(attributedString: attributedString)
        }
        // Set bold and italics
        else if (style2[0] && style2[1]) {
            boldItalicFont(attributedString: attributedString)
        }
        else {
            if style2[0] {
                // set bold
                textView.attributedText = boldText(attributedString: attributedString)
            }
            if style2[1] {
                // set italics
                textView.attributedText = italicsText(attributedString: attributedString)
            }
            if style2[2] {
                // set underline
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
                underlineText(attributedString: attributedString)
            }
        }
    }
    
    // Button style3
    @IBAction func style3(_ sender: UIButton) {
        let selectedString = textView.text as NSString
        let attributedString = NSMutableAttributedString(string: selectedString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0)])
       
        // Set bold, italics, and underline
        if(style3[0] && style3[1] && style3[2]) {
            let newFont = UIFont(name: "Arial-BoldItalicMT", size: 15.0)
            attributedString.addAttribute(NSAttributedString.Key.font, value: newFont as Any, range: textView.selectedRange)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
            underlineText(attributedString: attributedString)
            boldItalicFont(attributedString: attributedString)
        }
        // Set bold and italics
        else if (style3[0] && style3[1]) {
            boldItalicFont(attributedString: attributedString)
        }
        else {
            if style3[0] {
                // set bold
                textView.attributedText = boldText(attributedString: attributedString)
            }
            if style3[1] {
                // set italics
                textView.attributedText = italicsText(attributedString: attributedString)
            }
            if style3[2] {
                // set underline
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
                underlineText(attributedString: attributedString)
            }
        }
    }
    
    // Button style4
    @IBAction func style4(_ sender: UIButton) {
        let selectedString = textView.text as NSString
        let attributedString = NSMutableAttributedString(string: selectedString as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0)])
        
        // Set bold, italics, and underline
        if(style4[0] && style4[1] && style4[2]) {
            let newFont = UIFont(name: "Arial-BoldItalicMT", size: 15.0)
            attributedString.addAttribute(NSAttributedString.Key.font, value: newFont as Any, range: textView.selectedRange)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
            underlineText(attributedString: attributedString)
            boldItalicFont(attributedString: attributedString)
        }
        else if (style4[0] && style4[1]) {
            boldItalicFont(attributedString: attributedString)
        }
        // Set bold and italics
        else {
            if style4[0] {
                // set bold
                textView.attributedText = boldText(attributedString: attributedString)
            }
            if style4[1] {
                // set italics
                textView.attributedText = italicsText(attributedString: attributedString)
            }
            if style4[2] {
                // set underline
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: textView.selectedRange)
                underlineText(attributedString: attributedString)
            }
        }
    }
    
    // Make selected area bold and italics
    func boldItalicFont(attributedString: NSMutableAttributedString) {
        textView.attributedText = attributedString  // Make textView bold and italics the selected area
    }
    
    // Make selected area underline
    func underlineText(attributedString: NSMutableAttributedString) {
        textView.attributedText = attributedString  // Make textView underline the selected area
    }
    
    // Make selected area bold
    func boldText(attributedString: NSMutableAttributedString) -> NSAttributedString {
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15.0)]

        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: textView.selectedRange)
        
        return attributedString
    }
    
    // Make selected area italics
    func italicsText(attributedString: NSMutableAttributedString) -> NSAttributedString {
        let italicsFontAttribute = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 15.0)]
        
        // Part of string to be italics
        attributedString.addAttributes(italicsFontAttribute, range: textView.selectedRange)

        return attributedString
    }
}
