//
//  SwiftTextStorage.swift
//  highlight
//
//  Created by icafe on 16/1/13.
//  Copyright © 2016年 swiftcafe. All rights reserved.
//

import UIKit
import Foundation

class SwiftTextStorage: NSTextStorage {

    var _string = NSMutableAttributedString()

    override var string:String {

        get {

            return _string.string

        }

    }

    override func attributesAtIndex(location: Int, effectiveRange range: NSRangePointer) -> [String : AnyObject] {

        return _string.attributesAtIndex(location, effectiveRange: range)

    }    

    override func replaceCharactersInRange(range: NSRange, withString str: String) {

        _string.replaceCharactersInRange(range, withString: str)
        self.edited(NSTextStorageEditActions.EditedCharacters, range: range, changeInLength: str.characters.count - range.length)

    }

    override func setAttributes(attrs: [String : AnyObject]?, range: NSRange) {

        _string.setAttributes(attrs, range: range)
        self.edited(NSTextStorageEditActions.EditedAttributes, range: range, changeInLength: 0)

    }

    override func processEditing() {

        super.processEditing()
        
        do {

            let regex = try NSRegularExpression(pattern: "Swift", options: [])
            
            let paragraphRange = (self.string as NSString).paragraphRangeForRange(self.editedRange)
            
            regex.enumerateMatchesInString(self.string, options: [], range: paragraphRange) { result, flags, stop in

                self.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: result!.range)
                
            }

        } catch {
            
        }
        
    }
    
}
