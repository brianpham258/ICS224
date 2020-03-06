//
//  DetailViewController.swift
//  Lab4
//
//  Created by Brian Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class DetailViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var notesView: UITextView!
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var enableCamera: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateView: UITextField!
    
    var entry: PhotoEntry?
    var textChanged: Bool = false
    var photoChanged: Bool = false
    var dateChanged: Bool = false
    var isEntryEmpty: Bool = false
    static var isFirstLoad: Bool = true // Check if the app is opened the first time
    static var isEntryDeleted: Bool = false

    let OFFSET: CGFloat = 10
    
    // MARK: - Delegate Function
    override func viewDidLoad() {
        super.viewDidLoad()
        enableCamera.isEnabled = false  // Disable camera if no entry is selected
        dateView.isHidden = true        // Disable dateView if no entry is selected
        datePicker.isHidden = true      // DIsable UIDatePicker if no entry is selected
        
        if(DetailViewController.isFirstLoad) {  // Disable camera, dateView, UIDatePicker at first load
            DetailViewController.isFirstLoad = false
        }
        else {
            enableCamera.isEnabled = true
            dateView.isHidden = false
            datePicker.isHidden = false
        }
        
        if(DetailViewController.isEntryDeleted) {  // Check if an entry is deleted
            DetailViewController.isEntryDeleted = false
        }
        else {
            photoView.image = entry?.photo // Load the photo from PhotoEntry
            notesView.text = entry?.notes // Load the note from PhotoEntry
            dateView.text = entry?.date // Load the date from PhotoEntry
            notesView.delegate = self
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared), name:
                UIWindow.keyboardDidShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappeared), name:
                UIWindow.keyboardDidHideNotification, object: nil)
        }
    }
    
    // Check if the note area is changed or not
    func textViewDidChange(_ textView: UITextView){
        entry?.notes = textView.text     // Replace the old note in PhotoEntry with the new note
        textChanged = true      // Check if note is changed or not
    }
    
    // Enable keyboard
    @objc func keyboardAppeared(_ notification: NSNotification) {
        guard let frameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as?
            NSValue else {
                return
        }
        let frame = frameValue.cgRectValue
        scrollVIew.contentInset.bottom = frame.size.height + OFFSET
        scrollVIew.verticalScrollIndicatorInsets.bottom = frame.size.height + OFFSET
    }
    
    // Disable keyboard
    @objc func keyboardDisappeared(_ notification: NSNotification) {
        scrollVIew.contentInset.bottom = 0
        scrollVIew.verticalScrollIndicatorInsets.bottom = 0
    }
    
    // Take photo
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
        photoChanged = true
        entry?.photo = photoView.image!     // Replace the old photo in PhotoEntry with the new photo
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
    }
    
    // Detect any change of the UIDatePicker
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm a"    // Set a format for date
        dateView.text = df.string(from: datePicker.date)    // Convert from Date type to String type
        entry?.date = dateView.text ?? ""   // Replace the old date in PhotoEntry with the new date
        dateChanged = true
    }
}

