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

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
         PHPhotoLibrary.requestAuthorization({ status in
            if status == .authorized {
                DispatchQueue.main.async {
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated:true, completion:nil)
                }
            }
        })
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func clearImage(_ sender: Any) {
        image.image = nil
    }
    
    @IBAction func loadImage(_ sender: Any) {
        image.image = UIImage(named: "defaultImage")!

        guard let fileName = imageName.text else {
            os_log("Load error: Missing file name")
            return
        }
        
        do {
            let data = try Data(contentsOf: archiveURL.appendingPathComponent(fileName))
            image.image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIImage
        } catch {
            os_log("Load error: %@", log: OSLog.default, type: .debug, error.localizedDescription)
            return
        }
    }
    
    @IBAction func saveImage(_ sender: Any) {
        guard let fileImage = image.image else {
            os_log("Save error: Missing image")
            return
        }

        guard let fileName = imageName.text else {
            os_log("Save error: Missing file name")
            return
        }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: fileImage, requiringSecureCoding: false)
            try data.write(to: archiveURL.appendingPathComponent(fileName))
        } catch {
            os_log("Save error: %@", log: OSLog.default, type: .debug, error.localizedDescription)
            return
        }
    }
    
}
