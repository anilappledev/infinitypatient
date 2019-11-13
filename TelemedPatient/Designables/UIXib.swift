//
//  DesignableButton.swift
//  SkyApp
//
//  Created by Avtar Singh on 12/18/16.
//  Developer Email: dhaliwal.avtar1@gmail.com
//

import UIKit

@IBDesignable
class UIXib : UIView{
    var contentView:UIView?
    @IBInspectable var nibName:String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    
    override func awakeFromNib() {
        xibSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    func xibSetup(){
        guard let view = loadFromNib() else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadFromNib()->UIView?{
        guard let nibName = nibName else { return nil}
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,
                               options: nil).first as? UIView
    }
    
}
