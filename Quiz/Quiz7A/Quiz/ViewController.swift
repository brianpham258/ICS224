//
//  ViewController.swift
//  Quiz
//
//  Created by Test Account on 2020-01-14.
//  Copyright © 2020 Test Account. All rights reserved.
//

import UIKit
import os
import Photos

///
/// Modify Assets.xcassets, Info.plist, Main.storyboard, and ViewController.swift so that:
/// (1) By default, the app displays Camosun.png (located in the Quiz7 folder) in the UIImageView (see the main storyboard)
/// (2) Pressing the clear button clears the UIImageView
/// (3) Pressing the Load button displays an image with the name given in the text field in the UIImageView; if an error occurs, the error message is logged and Camosun.png is displayed
/// (4) Pressing the Save button saves the image with the name given in the text field; if an error occurs, the error message is logged
/// (5) Tapping the UIImageView brings up the PhotoLibrary selector; if a photo is selected, it is displayed in the UIImageView
///

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let archiveURL = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images.insert(UIImage(named:"defaultImage")!, at: 0)
        imageView.image = images[0]
    }

    @IBAction func clear(_ sender: UIButton) {
        imageView.image = nil
    }
    
    @IBAction func load(_ sender: UIButton) {
        loadObject() == nil ? images.insert(UIImage(named:"defaultImage")!, at: 0) : (images = loadObject()!)
    }
    
    func loadObject() -> [UIImage]? {
        do {
            // Try to load data from memory
            let data = try Data(contentsOf: archiveURL.appendingPathComponent(textField.text ?? ""))
            // return data (photo, notes, date) as an array of PhotoEntry type
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [UIImage]
        } catch {
            // Catch any error then print to console
            os_log("Cannot load due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
            return nil
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        do {
            // store data (photo, notes, date) to variable data
            let data = try NSKeyedArchiver.archivedData(withRootObject: images, requiringSecureCoding: false)
            // try to write data to a file with the given URL in PhotoEntry.swift file
            try data.write(to: archiveURL.appendingPathComponent(textField.text ?? ""))
        } catch {
            // catch any error then print to console
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
    
    // Select a photo from photo library
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        PHPhotoLibrary.requestAuthorization({ status in
            if status == .authorized {
                DispatchQueue.main.async {
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated: true, completion: nil)
                }
            }
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage   // Save the new photo to
                                                                                            // photoView variable
        picker.dismiss(animated: true, completion: nil)     // Dismiss the camera
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
