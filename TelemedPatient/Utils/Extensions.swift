//
//  Extensions.swift
//  iBlah-Blah
//
//  Created by Aditya Srivastava on 23/04/19.
//  Copyright © 2019 Aditya Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "AvenirNext-Bold", size: 16)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}

extension String{
    func toTime()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
    func toDate()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
    
    func toDateWeekday()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateFormat = "EEE MMM dd"
        
       
        var strDate = ""
        strDate = formatter.string(from: date)
        let finaldate = strDate.uppercased()
    
        return finaldate
    }
    
    func topDate()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
extension UITableView {
    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
    
    //Variable-height UITableView tableHeaderView with autolayout
    func layoutTableHeaderView() {
        
        guard let headerView = self.tableHeaderView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerWidth = headerView.bounds.size.width;
        let temporaryWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "[headerView(width)]", options: NSLayoutConstraint.FormatOptions(rawValue: UInt(0)), metrics: ["width": headerWidth], views: ["headerView": headerView])
        
        headerView.addConstraints(temporaryWidthConstraints)
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = headerSize.height
        var frame = headerView.frame
        
        frame.size.height = height
        headerView.frame = frame
        
        self.tableHeaderView = headerView
        
        headerView.removeConstraints(temporaryWidthConstraints)
        headerView.translatesAutoresizingMaskIntoConstraints = true
        
    }
}

public extension String{

func EmailValidation() -> Bool
{
    let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReg)
    if emailTest.evaluate(with: self) == false {
        return false
    }
    else
    {
        return true
    }
}
func PasswordValidationCheck() -> Bool
{
    
    //        Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
    
    
    let passReg = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,}$"
    
    
    let passTest = NSPredicate(format: "SELF MATCHES %@", passReg)
    if passTest.evaluate(with: self) == false {
        return false
    }
    else
    {
        return true
    }
    
}
var isNumeric: Bool {
    guard self.count > 0 else { return false }
    let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    return Set(self).isSubset(of: nums)//(self.characters).isSubset(of: nums)
}
var isContainsLetters : Bool{
    let letters = CharacterSet.letters
    return self.rangeOfCharacter(from: letters) != nil
}
var isContainsNumbers : Bool{
    let numbers = CharacterSet(charactersIn: "0123456789")
    return self.rangeOfCharacter(from: numbers) != nil
}
}
