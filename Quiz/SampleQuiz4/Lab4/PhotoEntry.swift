//
//  PhotoEntry.swift
//  Lab4
//
//  Created by Quang Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import Foundation
import UIKit

class PhotoEntry: NSObject {
    // MARK: - Properties
    var photo: UIImage
    var notes: String
    
    // MARK: - Initializers
    init(photo: UIImage, notes: String) {
        self.photo = photo
        self.notes = notes
    }
}
