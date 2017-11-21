//
//  CircleDesignable.swift
//  Shopping List
//
//  Created by Sergey Leskov on 6/15/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import UIKit

let π:CGFloat = CGFloat(Double.pi)

@IBDesignable
class CircleDesignable: UIView {
    
    @IBInspectable var progressColor: UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var circleColor: UIColor = UIColor.lightGray {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var lineWidth: CGFloat = 7
    @IBInspectable var percent: Int64 = 33 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        //circle
        var startAngle: CGFloat =  0
        var endAngle: CGFloat = 2 * π
        
        let pathCircle = UIBezierPath(arcCenter: center,
                                      radius: radius/2 - (lineWidth/2 + 1),
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        
        pathCircle.lineWidth = lineWidth
        circleColor.setStroke()
        pathCircle.stroke()
        
        
        
        //progress
        let lenghtCircle = CGFloat(percent)/100 * 2 * π
        let pointStart = 3/2 * π
        //        startAngle =  3/2 * π
        //        endAngle = 2 * π
        
        startAngle =  pointStart
        endAngle = pointStart + lenghtCircle
        
        
        let pathProgress = UIBezierPath(arcCenter: center,
                                        radius: radius/2 - (lineWidth/2 + 1),
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
        
        pathProgress.lineWidth = lineWidth
        progressColor.setStroke()
        pathProgress.stroke()
        
        
    }
}
