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
class ButtonPlusDesignable: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
            changeLayer()
        }
    }
    @IBInspectable var lineColor: UIColor = UIColor.white
    @IBInspectable var isShadow: Bool = true
    
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
        let space  = width/4
        let lineWidth  = width/20
        
        //line1
        let path1 = UIBezierPath()
        let start1  = CGPoint(x: space, y: height/2)
        let end1    = CGPoint(x: width - space, y: height/2)
        
        path1.move(to: start1)
        path1.addLine(to: end1)
        
        path1.lineWidth = lineWidth
        
        _lineColor.setStroke()
        path1.stroke()
        
        //line2
        let path2 = UIBezierPath()
        let start2  = CGPoint(x: width/2, y: space)
        let end2    = CGPoint(x: width/2, y: height - space)
        
        path2.move(to: start2)
        path2.addLine(to: end2)
        
        path2.lineWidth = lineWidth
        
        _lineColor.setStroke()
        path2.stroke()
        
         layer.cornerRadius = frame.size.width / 2.0
    }
    
    
}
