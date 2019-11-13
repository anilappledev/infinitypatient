//
//  UIViewX.swift
//  DesignableX
//
//  Created by Avtar Singh on 12/18/16.
//  Developer Email: dhaliwal.avtar1@gmail.com
//

import UIKit

@IBDesignable
class UIViewX: UIView {
    
    // MARK: - Gradient
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var thirdColor:UIColor = UIColor.white{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor,thirdColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    // MARK: - Border
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
           updateCornerRadius()
        }
    }
    
    @IBInspectable public var cornerRadiusIpad: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    func updateCornerRadius(){
        if DeviceType.IS_IPAD{
            layer.cornerRadius = cornerRadiusIpad
        }else{
            layer.cornerRadius = cornerRadius
        }
    }
    
   
}

extension UIView {
    
    func searchVisualEffectsSubview() -> UIVisualEffectView? {
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        } else {
            for subview in subviews {
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        return nil
    }
    
    /// This is the function to get subViews of a view of a particular type
    /// https://stackoverflow.com/a/45297466/5321670
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    /// https://stackoverflow.com/a/45297466/5321670
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
    
    func pathSemiCirclesPathForView()
    {
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let givenFrame = self.frame
        let zigZagWidth = CGFloat(7)
        let zigZagHeight = CGFloat(5)
        var yInitial = height-zigZagHeight
        
        var zigZagPath = UIBezierPath()
        zigZagPath.move(to: CGPoint(x:0, y:0))
        // zigZagPath.addLine(to: CGPoint(x:0, y:0))
        
        var slope = -1
        var x = CGFloat(0)
        var i = 0
        while x < width {
            x = zigZagWidth * CGFloat(i)
            let p = zigZagHeight * CGFloat(slope)
            let y = yInitial + p
            let point = CGPoint(x: x, y: y)
            zigZagPath.addLine(to: point)
            slope = slope*(-1)
            i += 1
        }
        
        zigZagPath.addLine(to: CGPoint(x:width,y: 0))
        //
        //        yInitial = 0 + zigZagHeight
        //        x = CGFloat(width)
        //        i = 0
        //        while x > 0 {
        //            x = width - (zigZagWidth * CGFloat(i))
        //            let p = zigZagHeight * CGFloat(slope)
        //            let y = yInitial + p
        //            let point = CGPoint(x: x, y: y)
        //            zigZagPath.addLine(to: point)
        //            slope = slope*(-1)
        //            i += 1
        //        }
        zigZagPath.close()
        let shapeLayer = CAShapeLayer(layer: self.layer)
        
        shapeLayer.path = zigZagPath.cgPath
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.masksToBounds = true
        shapeLayer.shadowOpacity = 1
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 3
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.backgroundColor = UIColor.white
        
    }
    
}
