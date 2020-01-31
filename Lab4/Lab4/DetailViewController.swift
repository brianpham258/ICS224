//
//  DetailViewController.swift
//  Lab4
//
//  Created by Brian Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var notesView: UITextView!
    var entry: PhotoEntry?
    
    // MARK: - Delegate Function
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = entry?.photo
        notesView.text = entry?.notes
    }
}

