//
//  LikeDislikeFloater.swift
//  FanaticTV
//
//  Created by MAC-OBS-26 on 08/07/22.
//  Copyright © 2022 fanaticTV. All rights reserved.
//

import UIKit

@IBDesignable public class Floater: UIView {
        
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    var image4: UIImage?
    
    var isAnimating: Bool = false
    var views: [UIView]!
    var duration: TimeInterval = 1.0
    var duration1: TimeInterval = 2.0
    var duration2: TimeInterval = 2.0
    var floatieSize = CGSize(width: 50, height: 50)
    var floatieDelay: Double = 0.5
    var delay: Double = 1.0
    var startingAlpha: CGFloat = 1.0
    var endingAlpha: CGFloat = 0.0
    var upwards: Bool = true
    var remove: Bool = true
    
    @IBInspectable var removeAtEnd: Bool = true {
        didSet {
            remove = removeAtEnd
        }
    }
    @IBInspectable var FloatingUp: Bool = true {
        didSet {
            upwards = FloatingUp
        }
    }
    @IBInspectable var alphaAtStart: CGFloat = 1.0 {
        didSet {
            startingAlpha = alphaAtStart
        }
    }
    @IBInspectable var alphaAtEnd: CGFloat = 0.0 {
        didSet {
            endingAlpha = alphaAtEnd
        }
    }
    @IBInspectable var rotationSpeed: Double = 10 {
        didSet {
            duration2 = 20 / rotationSpeed
        }
    }
    @IBInspectable var density: Double = 10 {
        didSet {
            floatieDelay = 1 / density
        }
    }
    @IBInspectable var delayedStart: Double = 10 {
        didSet {
            delay = delayedStart
        }
    }
    @IBInspectable var speedY: CGFloat = 10 {
        didSet {
            duration = Double(10/speedY)
        }
    }
    @IBInspectable var speedX: CGFloat = 5 {
        didSet {
            duration1 = Double(10/speedX)
        }
    }
    @IBInspectable var floatieWidth: CGFloat = 50 {
        didSet {
            floatieSize.width = floatieWidth
        }
    }
    @IBInspectable var floatieHeight: CGFloat = 50 {
        didSet {
            floatieSize.height = floatieHeight
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var floaterImage1: UIImage? {
        didSet {
            image1 = floaterImage1
        }
    }
    @IBInspectable var floaterImage2: UIImage? {
        didSet {
            image2 = floaterImage2
        }
    }
    @IBInspectable var floaterImage3: UIImage? {
        didSet {
            image3 = floaterImage3
        }
    }
    @IBInspectable var floaterImage4: UIImage? {
        didSet {
            image4 = floaterImage4
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func startAnimation() {
        let frameW = self.frame.width
        let frameH = self.frame.height
        var startingPoint: CGFloat!
        var endingPoint: CGFloat!

        if upwards {
                startingPoint = frameH
                endingPoint = floatieHeight*2
        } else {
                startingPoint = 0
                endingPoint = frameH - floatieHeight*2
        }
        let randomX = self.randomFloatBetweenNumbers(firstNum: 0 + self.floatieSize.width/2, secondNum: self.frame.width - self.floatieSize.width/2)
        let floatieView = UIView(frame: CGRect(x: 10, y: startingPoint, width: 50, height: 50))
        self.addSubview(floatieView)
        let floatie = UIImageView(frame: CGRect(x: 0, y: 0, width: self.floatieSize.width, height: self.floatieSize.height))
        floatie.image = image1
        floatieView.addSubview(floatie)
        
        UIView.animate(withDuration: self.duration, delay: 0,
                                     options: [], animations: {
            floatieView.center.y = endingPoint
            floatie.alpha = self.endingAlpha
        }, completion: {(value: Bool) in
            if self.remove {
                floatieView.removeFromSuperview()
            }
        })
        let randomNumber = self.randomIntBetweenNumbers(firstNum: 1, secondNum: 2)
        var randomRotation: CGFloat!
        if randomNumber == 1 {
                randomRotation = -1
        } else {
                randomRotation = 1
        }
        
        var xChange: CGFloat!
        if randomX < self.frame.width/2 {
            xChange = randomX + self.randomFloatBetweenNumbers(firstNum: randomX, secondNum: frameW-randomX)
        } else {
            xChange = self.randomFloatBetweenNumbers(firstNum: self.floatieSize.width*2, secondNum: randomX)
        }
        
        UIView.animate(withDuration: self.duration1, delay: 0,
                                     options: [.repeat, .autoreverse], animations: {
            floatieView.center.x = xChange
        }, completion: nil)
        UIView.animate(withDuration: self.duration2, delay: 0, options: [.repeat, .autoreverse], animations: {floatieView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2) * randomRotation)
        }, completion: nil)
        
    }
    
    func stopAnimation() {
        print("Stop Animating")
        views = []
        isAnimating = false
        if !views.isEmpty {
            for i in views {
                i.removeFromSuperview()
            }
        }
    }
    
    func randomFloatBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func randomIntBetweenNumbers(firstNum: Int, secondNum: Int) -> Int{
        return firstNum + Int(arc4random_uniform(UInt32(secondNum - firstNum + 1)))
    }
    
    
}
