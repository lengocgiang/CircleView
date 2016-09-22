//
//  CircleView.swift
//  example
//
//  Created by Giang Le Ngoc on 9/21/16.
//  Copyright © 2016 Giang Le Ngoc. All rights reserved.
//

import Foundation
import UIKit

class CircleView: UIView {
    var circleLayer: CAShapeLayer!
    var isAnimating: Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Create cicle path by
        let arcPoint = CGPoint(x: frame.size.width / 2.0 , y: frame.size.height / 2.0)
        let radius = frame.size.width  / 2.0
        let ciclePath = UIBezierPath(arcCenter: arcPoint, radius: radius, startAngle: 0.0, endAngle:CGFloat(2.0 * M_PI), clockwise: true)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = ciclePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 1.0
        circleLayer.strokeEnd = 0.0
        layer.addSublayer(circleLayer)
        
        //Rotate the circle so it starts from the top.
        self.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        
        isAnimating = false
    }
    
    
    func animationStyleStockEnd(duration: TimeInterval, fromValue: CGFloat, toValue: CGFloat) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd") // We'll draw from angle (0, 2π)
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.repeatCount = Float.infinity // infinity animation
        
        // We'll show animation ease in ease out to draw cicle fromValue -> toValue
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        circleLayer.strokeEnd = 1.0
        
        circleLayer.add(animation, forKey: "strockEndAnimation")
    }
    
    
    func startAnimation() {
        isAnimating = true
        animationRotateView(duration: 1.0, fromValue: 0.0, toValue: CGFloat(2 * M_PI))
    }
    
    func stopAnimation() {
        isAnimating = false
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    private func animationRotateView(duration: TimeInterval, fromValue: CGFloat, toValue: CGFloat) {
        // I need draw to 80% circle
        circleLayer.strokeEnd = 0.8
        
        // We'll use rotation around Z axis
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.repeatCount = Float.infinity
        self.layer.add(animation, forKey: "rorationAnimation")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
