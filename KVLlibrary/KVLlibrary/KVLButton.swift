//
//  KVLButton.swift
//  KVLLibraries
//
//  Created by Keval Patel on 3/14/18.
//  Copyright © 2018 Keval Patel. All rights reserved.
//

import UIKit
@IBDesignable
class KVLButton : UIButton{
    var Radi : CGFloat?
    
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
    @IBInspectable var Textcolor : UIColor?{
        didSet{
            setTitleColor(Textcolor, for: .normal)
        }
    }
    @IBInspectable var HLTextcolor: UIColor?{
        didSet{
            setTitleColor(HLTextcolor, for: .highlighted)
        }
    }
    @IBInspectable var HLImage: UIImage?{
        didSet{
            setImage(HLImage, for: .highlighted)
        }
    }
    @IBInspectable var Image : UIImage?{
        didSet{
            setImage(Image, for: .normal)
        }
    }

    @IBInspectable var Backgroundcolor: UIColor = UIColor.clear {
        didSet {
            setBackgroundImage(getImageWithColor(Backgroundcolor, size: CGSize(width: 1, height: 1)), for: .normal)
        }
    }
    @IBInspectable var HLBackgroundcolor: UIColor = UIColor.clear {
        didSet {
            setBackgroundImage(getImageWithColor(HLBackgroundcolor, size: CGSize(width: 1, height: 1)), for: .highlighted)
        }
    }
    func getImageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect  =  CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }

}











