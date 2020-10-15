//
//  TextDesinableView.swift
//  Agile-tech
//
//  Created by mahesh mannapperuma on R 2/10/14.
//

import UIKit
@IBDesignable
class TextDesinableView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: CGFloat = 0{
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable var shadowOffSetY: CGFloat = 0{
        didSet{
            layer.shadowOffset.height = shadowOffSetY
        }
    }
    
}
