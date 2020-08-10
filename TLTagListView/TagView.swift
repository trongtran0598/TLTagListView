//
//  TagView.swift
//  TagView2
//
//  Created by admin on 8/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol IndexItem {
    func didTouchButtonRemove(_ sender: Int)
    func didTouchButtonSelect(_ sender: Int)
    
}

class TagView: UIView {
    
    var tagString = String()
    
    var textlable = UILabel()
    
    var buttonEdit = UIButton()
    
    var buttonSelect = UIButton()
    
    var delegate: IndexItem?
    
    open var cornerRadius: CGFloat = 15.0
    
    open var tagBackgroundColor : UIColor = .gray
    
    open var borderWidth: CGFloat = 0.0
    
    open var borderColor: UIColor = .white
    
    
    

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect, tagString : String, tagNumber: Int,font: UIFont, hasButton: Bool = true) {
        super.init(frame: frame)
        self.tagString = tagString
        createTagCloud(frame: frame, OnView: self, data: tagString, tag: tagNumber, font: font, hasButton: hasButton)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        assert(false, "Not implemented")
    }
    
    
    
    
    
    func createTagCloud(frame: CGRect,OnView view: UIView, data:String, tag: Int, font: UIFont, hasButton: Bool) {
        let startstring = data
        let width = startstring.widthOfString(usingFont: UIFont(name:"verdana", size: 13.0)!)
        
        //View Contain
        view.frame = frame
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.backgroundColor = .gray
        view.tag = tag
        
        //Content
        textlable = UILabel(frame: CGRect(x: 17.0, y: 0.0, width: width, height: self.frame.size.height))
        textlable.font = font
        textlable.text = startstring
        textlable.textColor = UIColor.white
        view.addSubview(textlable)
        
        buttonSelect = UIButton(frame: textlable.frame)
        buttonSelect.backgroundColor = .clear
        buttonSelect.addTarget(self, action: #selector(selectTag(_:)), for: .touchUpInside)
        buttonSelect.tag = tag
        view.addSubview(buttonSelect)
        
        
        
        
        //Button delete
        if hasButton {
            buttonEdit = UIButton(type: .custom)
            buttonEdit.frame = CGRect(x: view.frame.size.width - 2.5 - 23.0, y: 3.0, width: 23.0, height: 23.0)
            buttonEdit.backgroundColor = UIColor.white
            buttonEdit.layer.cornerRadius = CGFloat(buttonEdit.frame.size.width)/CGFloat(2.0)
            buttonEdit.setImage(UIImage(named: "CrossWithoutCircle"), for: .normal)
            buttonEdit.tag = tag
            buttonEdit.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
            view.addSubview(buttonEdit)
            
        }
        
    }
    
    @objc func removeTag(_ sender: AnyObject) {
        delegate?.didTouchButtonRemove(sender.tag - 1)
    }
    
    @objc func selectTag(_ sender: AnyObject) {
        delegate?.didTouchButtonSelect(sender.tag - 1)
    }
    
}





