//
//  UISliderX.swift
//  004 - Calculator (Tip)
//
//  Created by Avtar Singh on 12/18/16.
//  Developer Email: dhaliwal.avtar1@gmail.com
//

import UIKit

@IBDesignable
class UISliderX: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
}
