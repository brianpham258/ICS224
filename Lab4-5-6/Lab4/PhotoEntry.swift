//
//  PhotoEntry.swift
//  Lab4
//
//  Created by Quang Pham on 2020-01-24.
//  Copyright © 2020 ics057. All rights reserved.
//

import Foundation
import UIKit
import os

class PropertyKey {
    static let photo = "photo"
    static let notes = "notes"
    static let date = "date"
}

class PhotoEntry: NSObject, NSCoding {
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("entries")
    
    // MARK: - Properties
    var photo: UIImage
    var notes: String
    var date: String
    
    // MARK: - Initializers
    init(photo: UIImage, notes: String, date: String) {
        self.photo = photo
        self.notes = notes
        self.date = date
    }
    
    // MARK: - Load/Save
    // Decode image and text to UIImage and String
    required convenience init?(coder aDecoder: NSCoder) {
        guard let newPhoto = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage else {
            os_log("Missing image", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let newNotes = aDecoder.decodeObject(forKey: PropertyKey.notes) as? String else {
            os_log("Missing notes", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let newDate = aDecoder.decodeObject(forKey: PropertyKey.date) as? String else {
            os_log("Missing date", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(photo: newPhoto, notes: newNotes, date: newDate)
    }
    
    // Encode image and text
    func encode(with aCoder: NSCoder) {
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(notes, forKey: PropertyKey.notes)
        aCoder.encode(date, forKey: PropertyKey.date)
    }
}
