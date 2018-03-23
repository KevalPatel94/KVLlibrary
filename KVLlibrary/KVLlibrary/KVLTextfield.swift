//
//  KVLTextfield.swift
//  KVLLibraries
//
//  Created by Keval Patel on 3/9/18.
//  Copyright © 2018 Keval Patel. All rights reserved.
//

import UIKit
@IBDesignable
class KVLTextfield: UITextField{
    
    var rightimageview : UIButton?
    var leftimageview : UIImageView?
    var rightButton : Bool?
    var ratioCornerRadius : Bool?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    @IBInspectable var EnableClear : Bool = false{
        didSet{
            if EnableClear == false{
                rightButton = false
            }
            else{
                rightButton = true
            }
        }
    }
    @IBInspectable var cursorColor : UIColor?{
        didSet{
            self.tintColor = cursorColor
        }
    }
    @IBInspectable var placeHolderColor: UIColor = .clear{
        didSet{
            setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
     @IBInspectable var leftviewWidth : CGFloat = 0{
        didSet{
            if leftimageview != nil {
                let width = leftviewWidth > leftImage!.size.width + 10 ? leftviewWidth : leftImage!.size.width + 10
                leftimageview?.frame = CGRect(x: self.frame.origin.x + 10, y: self.frame.origin.y + 2, width: width, height: self.frame.size.height - 4)
            }
        }
    }
    @IBInspectable var leftImage : UIImage?{
        didSet{
            if leftImage != nil{
                let width = leftviewWidth > (leftImage?.size.width)! + 10 ? leftviewWidth  : leftImage!.size.width + 10
                leftViewMode = UITextFieldViewMode.always
                leftimageview = UIImageView()
                leftimageview?.frame = CGRect(x: self.frame.origin.x + 10, y: self.frame.origin.y + 2, width: width, height: self.frame.size.height - 4)
                leftimageview?.image = leftImage
                leftView = leftimageview
                self.leftViewMode = .always
                leftimageview?.contentMode = .right
            }
        }
    }
    @IBInspectable var rightviewWidth : CGFloat = 0{
        didSet{
            if rightimageview != nil{
                let width = rightviewWidth > rightImage!.size.width + 10 ? rightviewWidth : rightImage!.size.width + 10
                rightimageview?.frame = CGRect(x: self.frame.origin.x + 5, y: self.frame.origin.y + 2, width: width, height: self.frame.size.height - 4)
            }
        }
    }
    @IBInspectable var rightImage : UIImage?{
        didSet{
            if rightImage != nil{
                let width = rightviewWidth > rightImage!.size.width + 10 ? rightviewWidth : rightImage!.size.width + 10
                rightViewMode = UITextFieldViewMode.always
                let button = UIButton()
                rightimageview = button
                rightimageview!.frame = CGRect(x: self.frame.size.width - width, y: self.frame.origin.y + 2, width: width, height: self.frame.size.height - 4)
                button.addTarget(self, action: #selector(self.clear), for: .touchUpInside)
                rightView = rightimageview
                self.rightViewMode = .always
                rightimageview?.contentMode = .left
                if rightButton == false{
                    button.isHidden = true
                }
                else{
                    button.isHidden = false
                    button.setImage(rightImage, for: .normal)

                }
            }
        }
    }
    @IBInspectable var IsFirstResponder: Bool = false{
        didSet{
            if IsFirstResponder == true{
                becomeFirstResponder()
            }
            else{
                IsFirstResponder = false
            }
        }
    }
    //MARK: - To Clear The Textfield Text
    @IBAction func clear(){
        self.text = ""
    }
}







