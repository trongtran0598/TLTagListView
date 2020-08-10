//
//  ListTagView.swift
//  TagView2
//
//  Created by TrongTran on 8/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol DidSelectTagView {
    func didSelect(_ sender: String)
}

class ListTagView: UIView, IndexItem {
   
    
    
    var tagsArray:[String] = Array()
    
    var delegate: DidSelectTagView?
    
    open var font: UIFont = UIFont(name:"verdana", size: 13.0)!
    
    
    var hasButton: Bool = true

    
    public init(frame: CGRect, tagsArray : [String], hasButton: Bool) {
        super.init(frame: frame)
        self.tagsArray = tagsArray
        self.hasButton = hasButton
        createTagCloud(OnView: self, withArray: self.tagsArray, font: font, hasButton)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        assert(false, "Not implemented")
    }
    
    
    
    func createTagCloud(OnView view: UIView, withArray data:[String], font: UIFont,_ hasButton : Bool) {
        for tempView in view.subviews {
            tempView.removeFromSuperview()
        }
        var xPos:CGFloat = 15.0
        var yPos: CGFloat = 15.0
        var tag: Int = 1
        for str in data  {
            let startstring = str
            let width = startstring.widthOfString(usingFont: font)
            let height = startstring.heightOfString(usingFont: font)
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5 )
            //13.0 is the width between lable and cross button and 25.5 is cross button width and gap to right
            if checkWholeWidth > self.bounds.size.width - 30.0 {
                //we are exceeding size need to change xpos
                xPos = 15.0
                yPos = yPos + 29.0 + 8.0
            }
            
            //View Contain
            var frame = CGRect()
            if hasButton {
                frame = CGRect(x: xPos, y: yPos, width:width + 17.0 + 38.5 , height: height + 15.0)
                xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
            }else{
                frame = CGRect(x: xPos, y: yPos, width:width + 17.0 + 15.0 , height: height + 15.0)
                xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(20.0)
            }
            
           let tagView = TagView(frame: frame, tagString: startstring, tagNumber: tag, font:font, hasButton: hasButton)
            tagView.delegate = self


    
            view.addSubview(tagView)
            tag = tag  + 1
        }
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.bounds.width, height: yPos + 37.0)
        
    }
    
    
    
    func didTouchButtonRemove(_ sender: Int) {
        self.tagsArray.remove(at: sender)
        createTagCloud(OnView: self, withArray: self.tagsArray,font: font, hasButton)
    }
    
    func didTouchButtonSelect(_ sender: Int) {
        delegate?.didSelect(tagsArray[sender])
       }
    
}

  extension String {
        
        func widthOfString(usingFont font: UIFont) -> CGFloat {
            let fontAttributes = [NSAttributedString.Key.font: font]
            let size = self.size(withAttributes: fontAttributes)
            return size.width
        }
        
        func heightOfString(usingFont font: UIFont) -> CGFloat {
            let fontAttributes = [NSAttributedString.Key.font: font]
            let size = self.size(withAttributes: fontAttributes)
            return size.height
        }

}
