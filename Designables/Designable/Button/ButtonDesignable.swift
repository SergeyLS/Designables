//
//  ButtonDesignable.swift
//  Shopping List
//
//  Created by Sergey Leskov on 6/20/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ButtonDesignable: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.white
    @IBInspectable var textColor: UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
            changeLayer()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 13
    
    override var isHighlighted: Bool {
        didSet {
            changeLayer()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            changeLayer()
        }
    }

    
    override func awakeFromNib() {
        setupLayer()
        //self.setNeedsLayout()
        //self.setNeedsDisplay()
    }
    
    override func prepareForInterfaceBuilder() {
        setupLayer()
    }
    
    func setupLayer()  {
        setTitleColor(textColor, for: UIControlState.normal)
        setTitleColor(fillColor, for: UIControlState.highlighted)
        
        
        var title = (titleLabel?.text)!
        title = title.trimmingCharacters(in: .whitespaces)
        
        setTitle("   " + title + "   ", for: UIControlState.normal)
        
        changeLayer()
    }
    
    func changeLayer()  {
        if isHighlighted || isSelected {
            layer.cornerRadius = cornerRadius
            layer.borderWidth = 1
            layer.borderColor = textColor.cgColor
            layer.backgroundColor = textColor.cgColor
        } else {
            layer.cornerRadius = cornerRadius
            layer.borderWidth = 1
            layer.borderColor = textColor.cgColor
            layer.backgroundColor = fillColor.cgColor
            
        }
    }
}
