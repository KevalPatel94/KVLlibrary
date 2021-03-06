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
    var Radi : CGFloat?
    var colorStart : UIColor?
    var colorend : UIColor?

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
            }
            else
            {
                if Radi != nil{
                    layer.cornerRadius = Radi!
                }
                else{
                    layer.cornerRadius = 0.0
                }
                layer.masksToBounds = true
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            Radi = cornerRadius
            layer.masksToBounds = true
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
            gLayer.frame.size.width = self.frame.width + 150
            gLayer.colors = [colorStart!.cgColor, colorend!.cgColor]
            self.layer.addSublayer(gLayer)
        }
    }
}






