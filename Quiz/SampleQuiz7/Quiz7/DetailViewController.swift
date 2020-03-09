//
//  DetailViewController.swift
//  Quiz7
//
//  Created by Brian Pham on 2020-03-08.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import os

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var camera: UIBarButtonItem!
    @IBOutlet weak var photoView: UIImageView!
    
    var images = [UIImage]()
    let archiveURL = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Quiz6")

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoView.image = UIImage(named: "defaultImage")
        configureView()
        loadObject()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        // Check if the device has a camera
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let alert = UIAlertController(title: "Camera Error", message: "Camera not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Launch the camera controller
        AVCaptureDevice.requestAccess(for: AVMediaType.video) {
            response in if response {
                DispatchQueue.main.async {
                    let picker = UIImagePickerController()
                    picker.delegate = self
                    picker.sourceType = UIImagePickerController.SourceType.camera
                    picker.allowsEditing = true
                    self.present(picker, animated: true, completion: nil)
                }
            }
        }
    }
    
    // Finish image capture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage   // Save the new photo to
                                                                                            // photoView variable
        picker.dismiss(animated: true, completion: nil)     // Dismiss the camera
        saveObject()
    }
    
    // Cancel the camera
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
        saveObject()
    }
    
    // Save object
    func saveObject() {
        images = [photoView.image!]
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: images, requiringSecureCoding: false) else {
            return
        }
        
        do {
            try data.write(to: archiveURL)
        }
        catch {
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
    
    // Load object
    func loadObject() {
        guard let data = try? Data(contentsOf: archiveURL) else {
            return
        }
        do {
            images = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [UIImage]
        }
        catch {
            return
        }
        
        photoView.image = images[0]
    }
}

