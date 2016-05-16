//
//  ImgExt.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 3/27/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class ImgExt: UIImageView {

    @IBInspectable var borderColor: UIColor = UIColor.clearColor(){
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var clipBound: Bool = true {
        didSet{
            clipsToBounds = true
        }
    }

}
