//
//  Document.swift
//  Lab7
//
//  Created by Brian Pham on 2020-03-06.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit

class Document: UIDocument {
    var text: NSAttributedString? = nil
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return try NSKeyedArchiver.archivedData(withRootObject: text!, requiringSecureCoding: false)
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        guard let data = contents as? Data else {
            return
        }
        text = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? NSAttributedString
    }
}

