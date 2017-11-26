//
//  ButtonPlusDesignable.swift
//  Shopping List
//
//  Created by Sergey Leskov on 6/21/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ButtonPlusMinusDesignable: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
            changeLayer()
        }
    }
    @IBInspectable var lineColor: UIColor = UIColor.white
    @IBInspectable var borderColor: UIColor = UIColor.blue
    @IBInspectable var isShadow: Bool = true
    @IBInspectable var isPlus: Bool  = true
    
    @IBInspectable var cornerRadius: CGFloat  = 5
    @IBInspectable var isLeftCorner: Bool  = true
    @IBInspectable var isRightCorner: Bool  = true
    
    override var isHighlighted: Bool {
        didSet {
            changeLayer()
        }
    }
    
    
    override func awakeFromNib() {
        setupLayer()
        //        self.setNeedsLayout()
        //        self.setNeedsDisplay()
    }
    
    override func prepareForInterfaceBuilder() {
        //setupLayer()
    }
    
    func setupLayer()  {
        
        
        if isShadow {
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2.0)
            layer.shadowRadius = 2.0
            layer.shadowOpacity = 1.0
            layer.masksToBounds = false
        }
        
        changeLayer()
    }
    
    func changeLayer()  {
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
        
        if isHighlighted  {
            layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            layer.backgroundColor = fillColor.cgColor
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let _lineColor = lineColor
        
        let width  = frame.size.width
        let height = frame.size.height
        let space  = height/4
        let lineWidth  = height/15
        
        //line goriz
        
        let path1 = UIBezierPath()
        let start1  = CGPoint(x: width/2-space, y: height/2)
        let end1    = CGPoint(x: width/2+space, y: height/2)
        
        path1.move(to: start1)
        path1.addLine(to: end1)
        
        path1.lineWidth = lineWidth
        
        _lineColor.setStroke()
        path1.stroke()
        
        
        //line vert
        if isPlus {
            let path2 = UIBezierPath()
            let start2  = CGPoint(x: width/2, y: space)
            let end2    = CGPoint(x: width/2, y: height - space)
            
            path2.move(to: start2)
            path2.addLine(to: end2)
            
            path2.lineWidth = lineWidth
            
            _lineColor.setStroke()
            path2.stroke()
        }
        
        layer.cornerRadius = cornerRadius
        if isLeftCorner && !isRightCorner {
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
        if !isLeftCorner && isRightCorner {
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
        
    }
    
    
}
