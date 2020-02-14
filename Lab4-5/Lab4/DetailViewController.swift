//
//  DetailViewController.swift
//  Lab4
//
//  Created by Brian Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    // MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var notesView: UITextView!
    @IBOutlet weak var scrollVIew: UIScrollView!
    var entry: PhotoEntry?
    var isChanged: Bool = false
    let OFFSET: CGFloat = 10
    
    // MARK: - Delegate Function
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = entry?.photo
        notesView.text = entry?.notes
        notesView.delegate = self
        isChanged = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared), name:
            UIWindow.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappeared), name:
            UIWindow.keyboardDidHideNotification, object: nil)
    }
    
    func textViewDidChange(_ textView: UITextView){
        entry?.notes = textView.text
        isChanged = true
    }
    
    @objc func keyboardAppeared(_ notification: NSNotification) {
        guard let frameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as?
            NSValue else {
                return
        }
        let frame = frameValue.cgRectValue
        scrollVIew.contentInset.bottom = frame.size.height + OFFSET
        scrollVIew.verticalScrollIndicatorInsets.bottom = frame.size.height + OFFSET
    }
    
    @objc func keyboardDisappeared(_ notification: NSNotification) {
        scrollVIew.contentInset.bottom = 0
        scrollVIew.verticalScrollIndicatorInsets.bottom = 0
    }
}

