//
//  KVLView.swift
//  KVLLibraries
//
//  Created by Keval Patel on 3/14/18.
//  Copyright © 2018 Keval Patel. All rights reserved.
//

import UIKit
@IBDesignable
class KVLView : UIView{
    var cornerRadi : CGFloat?
    var colorStart : UIColor?
    var colorend : UIColor?
    var IsCircle : Bool?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBInspectable var isCircle: Bool = false {
        didSet {
            if isCircle == true{
                layer.cornerRadius = frame.height/2
                layer.masksToBounds = true
                IsCircle = true
            }else
            {
                layer.cornerRadius = 0.0
                layer.masksToBounds = true
                IsCircle = false
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if IsCircle == false{
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = true
            }
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor : UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var startColor : UIColor?{
        didSet{
            colorStart = startColor
            gradientColor()
        }
    }
    @IBInspectable var endColor : UIColor?{
        didSet{
            colorend = endColor
            gradientColor()
        }
    }
    func gradientColor() {
        if colorStart != nil && colorend != nil{
            let gLayer = CAGradientLayer()
            gLayer.frame = self.bounds
            gLayer.colors = [colorStart!.cgColor, colorend!.cgColor]
            self.layer.addSublayer(gLayer)
        }
    }
}






