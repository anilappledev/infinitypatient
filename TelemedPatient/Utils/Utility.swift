
import Foundation
import UIKit
import CoreLocation


func convertTo_ddMMyyy(date:Date)->String{
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "dd/MM/yyy"
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    let timeStamp = dateFormatter.string(from: date)
    return timeStamp
}
func convertTommDDyyyy(date:Date)->String{
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "MM-dd-yyyy"
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    let timeStamp = dateFormatter.string(from: date)
    return timeStamp
}
func convertMinMAxDate(dateStr: String) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    return dateFormatter.date(from: dateStr)!
}

func convertDateFormater(dateStr: String) -> Date {
    let dateFormatter = DateFormatter()
    var d:String! =  ""
    if dateStr.contains("T"){
        d = dateStr.components(separatedBy: "T")[0]
    }
    else{
        d = dateStr.components(separatedBy: " ")[0]
    }
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = TimeZone(identifier: "UTC")
    
    guard let date = dateFormatter.date(from: d) else {
        assert(false, "no date from string")
        return Date()
    }
    
    //dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"
    //dateFormatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
    // let timeStamp = dateFormatter.string(from: date)
    
    //return timeStamp
    return date
}

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l >= r
    default:
        return !(lhs < rhs)
    }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l <= r
    default:
        return !(rhs < lhs)
    }
}


class Utility: NSObject
{
    class func isLocationServiceEnable() -> Bool
    {
        
        
        var locationOn:Bool = false
        
        if(CLLocationManager.locationServicesEnabled())
        {
            
            if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse)
            {
                locationOn = true
            }
            else if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways)
            {
                locationOn = true
            }
        }
        else
        {
            locationOn = false
        }
        
        return locationOn
    }
    
//    class func displayMakeToast(message: String)
//    {
//        let alertWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
//        alertWindow.rootViewController = UIViewController()
//        alertWindow.windowLevel = UIWindow.Level.alert + 1
//        alertWindow.makeKeyAndVisible()
//
//        alertWindow.makeToast(message)
//    }
}

let enableLog = true

func log(message: String, function: String = #function, file: String = #file, line: Int = #line)
{
    if(enableLog)
    {
        print("-----------START-------------")
        let url = NSURL(fileURLWithPath: file)
        print("Message = \"\(message)\" \n\n(File: \(String(describing: url.lastPathComponent)), Function: \(function), Line: \(line))")
        print("-----------END-------------\n")
    }
}


extension UINavigationController {
    
    func pushViewControllerFromTop(viewController vc: UIViewController) {
        vc.view.alpha = 0
        self.present(vc, animated: false) { () -> Void in
            vc.view.frame = CGRect(x:0, y:-vc.view.frame.height,width: vc.view.frame.width, height:vc.view.frame.height)
            vc.view.alpha = 1
            UIView.animate(withDuration: 1, animations: { () -> Void in
                vc.view.frame = CGRect(x:0,y: 0, width:vc.view.frame.width,height: vc.view.frame.height)
            },
                           completion: nil)
        }
    }
    
    func dismissViewControllerToTop() {
        if let vc = self.presentedViewController {
            UIView.animate(withDuration: 1, animations: { () -> Void in
                vc.view.frame = CGRect(x:0,y: -vc.view.frame.height,width: vc.view.frame.width,height: vc.view.frame.height)
            }, completion: { (complete) -> Void in
                if complete == true {
                    self.dismiss(animated: false, completion: nil)
                }
            })
        }
    }
}

func appVersion() -> String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as! String
   
    return "\(version)"
}
func appBuildVersion() -> String {
    let dictionary = Bundle.main.infoDictionary!
   
    let build = dictionary["CFBundleVersion"] as! String
    return "\(build)"
}

func getMajorSystemVersion() -> Int
{
    let systemVersionStr = UIDevice.current.systemVersion   //Returns 7.1.1
    let mainSystemVersion = Int((systemVersionStr.split{$0 == "."}.map(String.init))[0])
    
    return mainSystemVersion!
}

struct IOS_VERSION
{
    static var IS_IOS7 = getMajorSystemVersion() >= 7 && getMajorSystemVersion() < 8
    static var IS_IOS8 = getMajorSystemVersion() >= 8 && getMajorSystemVersion() < 9
    static var IS_IOS9 = getMajorSystemVersion() >= 9
}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    //static let IS_TV = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.TV
    
    static let IS_IPHONE_4_OR_LESS =  IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = IS_IPHONE && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

func getAppUniqueId() -> String
{
    let uniqueId: UUID = UIDevice.current.identifierForVendor! as UUID
    
    return uniqueId.uuidString
}

public func jsonStringFromDictionaryOrArrayObject(_ obj: AnyObject) -> String
{
    do
    {
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted)
        _ = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        let json = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
        let jsonStr = String(data: json, encoding: .utf8)
        return jsonStr as! String
    }
    catch let error as NSError
    {
        print("Error!! = \(error)")
    }
    
    return ""
}

public func jsonObjectFromJsonString(_ jsonString: String) -> AnyObject
{
    do
    {
        let jsonData = jsonString.data(using: String.Encoding.utf8)!
        let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
        
        return jsonObj as AnyObject
    }
    catch let error as NSError
    {
        print("Error!! = \(error)")
    }
    
    return "" as AnyObject
}

//http://stackoverflow.com/questions/27044095/swift-how-to-remove-a-null-value-from-dictionary
/*extension Dictionary where Key: String, Value: AnyObject
 {
 
 }*/

public func getCleanedObj(_ dataObj: [String: AnyObject]) -> [String: AnyObject]
{
    var jsonCleanDictionary = [String: AnyObject]()
    
    for (key, value) in dataObj
    {
        if !(value is NSNull)
        {
            if let valueNumber = value as? NSNumber
            {
                jsonCleanDictionary[key] = valueNumber.stringValue as AnyObject?
            }
            else
            {
                jsonCleanDictionary[key] = value
            }
        }
    }
    
    return jsonCleanDictionary
}

public func setDataToPreference(_ data: AnyObject, forKey key: String)
{
    UserDefaults.standard.set(data, forKey: key)
    UserDefaults.standard.synchronize()
}

public func getDataToPreference(_ data: AnyObject, forKey key: String) -> AnyObject
{
    return UserDefaults.standard.object(forKey: key)! as AnyObject
}

public func isPreferenceWithKeyExist(_ key: String) -> Bool
{
    return UserDefaults.standard.object(forKey: key) != nil
}


var TimeStampInterval: TimeInterval {
    return Date().timeIntervalSince1970
}

var TimeStampString: String {
    return "\(Date().timeIntervalSince1970)"
}

func printFonts()
{
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames
    {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = [\(names)]")
    }
}

extension CAShapeLayer {
    fileprivate func drawCircleAtLocation(_ location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        let origin = CGPoint(x: location.x - radius, y: location.y - radius)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}

private var handle: UInt8 = 0;

extension UIBarButtonItem {
    
    fileprivate var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    func addBadge(_ number: Int, withOffset offset: CGPoint = CGPoint.zero, andColor color: UIColor = UIColor.red, andFilled filled: Bool = true) {
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        badgeLayer?.removeFromSuperlayer()
        
        // Initialize Badge
        let badge = CAShapeLayer()
        let radius = CGFloat(7)
        let location = CGPoint(x: view.frame.width - (radius + offset.x), y: (radius + offset.y))
        badge.drawCircleAtLocation(location, withRadius: radius, andColor: color, filled: filled)
        view.layer.addSublayer(badge)
        
        // Initialiaze Badge's label
        let label = CATextLayer()
        label.string = "\(number)"
        label.alignmentMode = CATextLayerAlignmentMode.center
        label.fontSize = 11
        label.frame = CGRect(origin: CGPoint(x: location.x - 4, y: offset.y), size: CGSize(width: 8, height: 16))
        label.foregroundColor = filled ? UIColor.white.cgColor : color.cgColor
        label.backgroundColor = UIColor.clear.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)
        
        // Save Badge as UIBarButtonItem property
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func updateBadge(_ number: Int) {
        if let text = badgeLayer?.sublayers?.filter({ $0 is CATextLayer }).first as? CATextLayer {
            text.string = "\(number)"
        }
    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
    
}

func displayAlert(_ title: String, andMessage message: String,completion:@escaping ()->Void)
{
    let alertWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    alertWindow.rootViewController = UIViewController()
    alertWindow.windowLevel = UIWindow.Level.alert + 1
    alertWindow.makeKeyAndVisible()
    
    let alertController: UIAlertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { (action) -> Void in
        
        alertWindow.isHidden = true
        completion()
    }))
    
    alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
}
func displayAlert(_ title: String, andMessage message: String)
{
    let alertWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    alertWindow.rootViewController = UIViewController()
    alertWindow.windowLevel = UIWindow.Level.alert + 1
    alertWindow.makeKeyAndVisible()
    
    let alertController: UIAlertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { (action) -> Void in
        
        alertWindow.isHidden = true
        
    }))
    
    alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
}

func setStatusBarBackgroundColor(_ color: UIColor)
{
    guard  let statusBar = (UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject).value(forKey: "statusBar") as? UIView else {
        return
    }
    
    statusBar.backgroundColor = color
}

extension Int
{
    static func random(range: Range<Int> ) -> Int
    {
        var offset = 0
        
        if range.lowerBound < 0   // allow negative ranges
        {
            offset = abs(range.lowerBound)
        }
        
        let mini = UInt32(range.lowerBound + offset)
        let maxi = UInt32(range.upperBound   + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}

extension UIButton
{
    func centerVerticallyWithPadding(padding: CGFloat)
    {
        let imageSize: CGSize = (self.imageView?.frame.size)!
        let titleString: NSString = (self.titleLabel?.text)! as NSString
        let titleSize: CGSize = titleString.size(withAttributes: [NSAttributedString.Key.font: (self.titleLabel?.font)!])
        
        let totalHeight: CGFloat = imageSize.height + titleSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - imageSize.height), left: 0.0, bottom: 0.0, right: -titleSize.width)
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(totalHeight - titleSize.height), right: 0.0)
    }
    
    func centerVertically()
    {
        let kDefaultPadding: CGFloat  = 6.0;
        
        self.centerVerticallyWithPadding(padding: kDefaultPadding);
    }
    
    func addCornerRadius(_ radius: CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    
    
    
}



extension UITextField
{
    func addPadding(_ padding: CGFloat)
    {
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: padding, height: self.frame.height)
        
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func addCornerRadius(_ radius: CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    
    
    func addLeftIcon(leftImage:UIImage?,color:UIColor) {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            // let tintedImage = image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        
    }
    
    func addRightIcon(rightImage:UIImage?,color:UIColor) {
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            // let tintedImage = image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        // Placeholder text color
        
    }
    
    func setPlaceholderColor(color:UIColor){
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}

extension UITextView
{
    func addCornerRadius(_ radius: CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    
}

extension UITableView{
    func emptyMessage(message:String) {
        let messageLabel = UILabel(frame: CGRect(x:0,y:0,width:self.bounds.size.width, height:self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
        
    }
    
    func removeEmptyMessage(){
        self.backgroundView = nil
    }
}
extension UICollectionView{
    func emptyMessage(message:String){
        let messageLabel = UILabel(frame: CGRect(x:0,y:0,width:self.bounds.size.width, height:self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        
    }
    func removeEmptyMessage(){
        self.backgroundView = nil
    }
}

extension Date
{
    func isGreaterThanDate(_ dateToCompare: Date) -> Bool
    {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending
        {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(_ dateToCompare: Date) -> Bool
    {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending
        {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(_ dateToCompare: Date) -> Bool
    {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedSame
        {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(_ daysToAdd: Int) -> Date
    {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(_ hoursToAdd: Int) -> Date
    {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
    
    func getDateStringWithFormate(_ formate: String, timezone: String) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        formatter.timeZone = TimeZone(abbreviation: timezone)
        
        return formatter.string(from: self)
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func maxDaysOfMonth()->Int{
        return (Calendar.current.range(of: .day, in: .month, for:self)?.upperBound)!-1
    }
    
    func day()->Int{
        return Calendar.current.component(.day, from: self)
    }
    func month()->Int{
        return Calendar.current.component(.month, from: self)
    }
    func year()->Int{
        return Calendar.current.component(.year, from: self)
    }
    
    struct Week {
        var number:Int!
        var startDate:Date!
        var endDate:Date!
    }
    func week()->Week{
        
        
        let maxDaysOfMonth = self.maxDaysOfMonth()
        var week :Week!
        switch day() {
        case 1...7:
            week = Week(number: 1, startDate: createDate(day: 1, month: month(), year: year()), endDate: createDate(day: 7, month: month(), year: year()))
            break
        case 8...14:
             week = Week(number: 2, startDate: createDate(day: 8, month: month(), year: year()), endDate: createDate(day:14, month: month(), year: year()))
            break
        case 15...21:
             week = Week(number: 3, startDate: createDate(day: 15, month: month(), year: year()), endDate: createDate(day: 21, month: month(), year: year()))
            break
        case 22...maxDaysOfMonth:
              week = Week(number: 4, startDate: createDate(day: 22, month: month(), year: year()), endDate: createDate(day: maxDaysOfMonth, month: month(), year: year()))
            break
            
        default:
            break
        }
        return week
    }
    func createDate(day:Int,month:Int,year:Int,timeZone:String,hour:Int,minute:Int)->Date{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: timeZone) // Japan Standard Time
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
    }
    func createDate(day:Int,month:Int,year:Int,timeZone:String = "UTC")->Date{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: timeZone) // Japan Standard Time
      
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
    }
}

extension UIView
{
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    class func fromNib<T : UIView>(nibName:String) -> T {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)![0] as! T
    }
    
    func createShadow(color:CGColor,opacity:Float,radius:CGFloat){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }
    
    func roundedAllCorners(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    
    func updateLayerProperties() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
    }
    func rotate360Degrees(duration: CFTimeInterval = 0.5, completionDelegate: CAAnimationDelegate? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = .infinity
        
        if let delegate = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func animateFromTopToBottom(view v: UIView,completion: ((Bool) -> Swift.Void)? = nil) {
        v.alpha = 0
        
        v.frame = CGRect(x:0, y:-v.frame.height,width: v.frame.width, height:v.frame.height)
        v.alpha = 1
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            v.frame = CGRect(x:0,y: 0, width:v.frame.width,height: v.frame.height)
        },completion: completion)
    }
    
    func animateBottomToTop(view v: UIView,completion: ((Bool) -> Swift.Void)? = nil) {
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            v.frame = CGRect(x:0,y: -v.frame.height,width: v.frame.width,height: v.frame.height)
        }, completion:completion)
        
        
        
    }
    
    func applyBorder(_ width: CGFloat, borderColor: UIColor)
    {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
        
    }
    
    func shake(repeatCount:Float) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.8
        animation.repeatCount = repeatCount
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}


extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x:0,y: childStartPoint.y, width:1, height:self.frame.height), animated: animated)
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
    
}

func validateEmail(_ candidate: String) -> Bool
{
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
}

func formatNumberStringToShortForm(_ numberStr: String) -> String
{
    var numberStr = numberStr
    numberStr = numberStr.replacingOccurrences(of: ",", with: "")
    
    
    if let numberDouble = Double(numberStr)// (numberStr as NSString).doubleValue
    {
        
        var shortNumber = numberDouble
        var suffixStr = ""
        
        if(numberDouble >= 1000000000.0)
        {
            suffixStr = "Arab"
            shortNumber = numberDouble / 1000000000.0
        }
        else if(numberDouble >= 10000000.0)
        {
            suffixStr = "Cr"
            shortNumber = numberDouble / 10000000.0
        }
        else if(numberDouble >= 100000.0)
        {
            suffixStr = "Lac"
            shortNumber = numberDouble / 100000.0
        }
        else if(numberDouble >= 1000.0)
        {
            suffixStr = "K"
            shortNumber = numberDouble / 1000.0
        }
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let numberAsString = numberFormatter.string(from: NSNumber(value: shortNumber as Double))
        let finalString = String(format: "%@ %@", numberAsString!, suffixStr)
        
        return finalString
    }
    
    return numberStr
}

func isStringContainsOnlyNumbers(_ string: String) -> Bool
{
    let charactersSet = NSMutableCharacterSet.decimalDigit()
    let badCharacters = charactersSet.inverted
    
    if string.rangeOfCharacter(from: badCharacters) == nil
    {
        print("string was a number")
        
        return true
    }
    else
    {
        print("string contained non-digit characters.")
        
        return false
    }
}

func isStringContainsOnlyNumbersWithFloatValue(_ string: String) -> Bool
{
    let charactersSet = NSMutableCharacterSet.decimalDigit()
    charactersSet.addCharacters(in: ".")
    let badCharacters = charactersSet.inverted
    
    if string.rangeOfCharacter(from: badCharacters) == nil
    {
        print("string was a number")
        
        return true
    }
    else
    {
        print("string contained non-digit characters.")
        
        return false
    }
}

func parseStringBetween(_ stringToParse: String, firstString: String, lastString: String) -> String
{
    let scanner = Scanner(string:stringToParse)
    var scanned: NSString?
    
    if scanner.scanUpTo(firstString, into:nil)
    {
        scanner.scanString(firstString, into:nil)
        if scanner.scanUpTo(lastString, into:&scanned)
        {
            let result: String = scanned! as String
            //print("parse result: \(result)") // result: google
            
            return result
        }
    }
    
    return ""
}

func getParsedImageUrl(_ imageUrl: String) -> String
{
    
    let nativeURL = URL(string: imageUrl)
    
    let pathComponents = nativeURL?.pathComponents
    
    var parsedString = parseStringBetween(imageUrl, firstString: "__", lastString: "__")
    
    parsedString = parsedString.replacingOccurrences(of: "w-", with: "")
    
    if(parsedString.isEmpty)
    {
        return ""
    }
    
    let widthArray = parsedString.components(separatedBy: "-")
    
    //var lowestDiff: Int = Int.max
    
    let device_width = Int(UIScreen.main.bounds.size.width * UIScreen.main.scale)
    
    var finalWidthStr: String = widthArray.last!
    
    for widthStr: String in widthArray
    {
        let currentWidth = Int(widthStr)
        
        /*let diff = abs(device_width - currentWidth!)
         
         if(diff < lowestDiff)
         {
         lowestDiff = diff;
         
         finalWidthStr = widthStr
         }*/
        
        if(currentWidth >= device_width)
        {
            finalWidthStr = widthStr
            break
        }
    }
    
    
    var finalUrl = imageUrl
    
    for component in pathComponents!
    {
        if(component.range(of: parsedString) != nil)
        {
            finalUrl = imageUrl.replacingOccurrences(of: component, with: "w\(finalWidthStr)")
            break
        }
    }
    
    return finalUrl
}

func getParsedImageUrl(_ imageUrl: String, width: Int) -> String
{
    
    let nativeURL = URL(string: imageUrl)
    
    let pathComponents = nativeURL?.pathComponents
    
    var parsedString = parseStringBetween(imageUrl, firstString: "__", lastString: "__")
    
    parsedString = parsedString.replacingOccurrences(of: "w-", with: "")
    
    if(parsedString.isEmpty)
    {
        return ""
    }
    
    let widthArray = parsedString.components(separatedBy: "-")
    
    //var lowestDiff: Int = Int.max
    
    let device_width = Int(CGFloat(width) * UIScreen.main.scale)
    
    var finalWidthStr: String = widthArray.last!
    
    for widthStr: String in widthArray
    {
        let currentWidth = Int(widthStr)
        
        /*let diff = abs(device_width - currentWidth!)
         
         if(diff < lowestDiff)
         {
         lowestDiff = diff;
         
         finalWidthStr = widthStr
         }*/
        
        if(currentWidth >= device_width)
        {
            finalWidthStr = widthStr
            break
        }
    }
    
    
    var finalUrl = imageUrl
    
    for component in pathComponents!
    {
        if(component.range(of: parsedString) != nil)
        {
            finalUrl = imageUrl.replacingOccurrences(of: component, with: "w\(finalWidthStr)")
            break
        }
    }
    
    return finalUrl
}


func getParsedImageUrl(_ imageUrl: String, maxWidth: Int) -> String
{
    
    let nativeURL = URL(string: imageUrl)
    
    let pathComponents = nativeURL?.pathComponents
    
    var parsedString = parseStringBetween(imageUrl, firstString: "__", lastString: "__")
    
    parsedString = parsedString.replacingOccurrences(of: "w-", with: "")
    
    if(parsedString.isEmpty)
    {
        return ""
    }
    
    let widthArray = parsedString.components(separatedBy: "-")
    
    var lowestDiff: Int = Int.max
    
    let device_width = maxWidth
    
    var finalWidthStr: String = widthArray.last!
    
    for widthStr: String in widthArray
    {
        let currentWidth = Int(widthStr)
        
        if(currentWidth <= maxWidth)
        {
            let diff = abs(device_width - currentWidth!)
            
            if(diff < lowestDiff)
            {
                lowestDiff = diff;
                
                finalWidthStr = widthStr
            }
        }
    }
    
    
    var finalUrl = imageUrl
    
    for component in pathComponents!
    {
        if(component.range(of: parsedString) != nil)
        {
            finalUrl = imageUrl.replacingOccurrences(of: component, with: "w\(finalWidthStr)")
            break
        }
    }
    
    return finalUrl
}


func getEncodedUrlComponentString(_ urlStr: String) -> String!
{
    return urlStr.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
}

func getEncodedUrlQueryString(_ urlStr: String) -> String!
{
    return urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
}

func getPercentEcodedString(urlStr:String){
    
}

func getConstraintForIdentifier(_ identifier: String, fromView: AnyObject) -> NSLayoutConstraint?
{
    for subview in fromView.subviews as [UIView]
    {
        for constraint in subview.constraints as [NSLayoutConstraint]
        {
            if constraint.identifier == identifier
            {
                return constraint
            }
        }
    }
    
    return nil
}

func getYouTubeVideoIdFromUrl(_ urlStr: String) -> String
{
    let regexString: String = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
    
    let regExp = try! NSRegularExpression(pattern: regexString, options: [.caseInsensitive])
    
    let array: [AnyObject] = regExp.matches(in: urlStr, options: [], range: NSMakeRange(0, urlStr.count))
    if array.count > 0
    {
        let result: NSTextCheckingResult = array.first as! NSTextCheckingResult
        return (urlStr as NSString).substring(with: result.range)
    }
    
    return ""
}

func getYouTubeThumbnailUrlFromVideoUrl(_ urlStr: String) -> String
{
    return "http://img.youtube.com/vi/\(getYouTubeVideoIdFromUrl(urlStr))/hqdefault.jpg"
}

func getExtentionFromUrl(_ urlStr: String) -> String
{
    let URL = Foundation.URL(string: urlStr)
    
    if let extention = URL?.pathExtension
    {
        return extention
    }
    
    return ""
}


func platform() -> String
{
    var systemInfo = utsname()
    uname(&systemInfo)
    
    let machine = systemInfo.machine
    let mirror = Mirror(reflecting: machine)
    var identifier = "unknown"
    
    for child in mirror.children
    {
        if let value = child.value as? Int8 , value != 0
        {
            identifier.append(String(UnicodeScalar(UInt8(value))))
        }
    }
    
    return identifier
}

func deviceNameString() -> String
{
    
    let pf = platform();
    if (pf == "iPhone1,1")   { return  "iPhone 1G"}
    if ( pf   == "iPhone1,2"  )    {return  "iPhone 3G"}
    if (  pf   == "iPhone2,1"  )    { return  "iPhone 3GS"}
    if (  pf   == "iPhone3,1"  )    { return  "iPhone 4"}
    if (  pf   == "iPhone3,3"  )    { return  "Verizon iPhone 4"}
    if (  pf   == "iPhone4,1"  )    { return  "iPhone 4S"}
    if (  pf   == "iPhone5,1"  )    { return  "iPhone 5 (GSM)"}
    if (  pf   == "iPhone5,2"  )    { return  "iPhone 5 (GSM+CDMA)"}
    if (  pf   == "iPhone5,3"  )    { return  "iPhone 5c (GSM)"}
    if (  pf   == "iPhone5,4"  )    { return  "iPhone 5c (GSM+CDMA)"}
    if (  pf   == "iPhone6,1"  )    { return  "iPhone 5s (GSM)"}
    if (  pf   == "iPhone6,2"  )    { return  "iPhone 5s (GSM+CDMA)"}
    if (  pf   == "iPhone7,1"  )    { return  "iPhone 6 Plus"}
    if (  pf   == "iPhone7,2"  )    { return  "iPhone 6"}
    if (  pf   == "iPhone8,1"  )    { return  "iPhone 6s Plus"}
    if (  pf   == "iPhone8,2"  )    { return  "iPhone 6s"}
    
    if (  pf   == "iPod1,1"  )      { return  "iPod Touch 1G"}
    if (  pf   == "iPod2,1"  )      { return  "iPod Touch 2G"}
    if (  pf   == "iPod3,1"  )      { return  "iPod Touch 3G"}
    if (  pf   == "iPod4,1"  )      { return  "iPod Touch 4G"}
    if (  pf   == "iPod5,1"  )      { return  "iPod Touch 5G"}
    if (  pf   == "iPad1,1"  )      { return  "iPad"}
    
    if (  pf   == "iPad2,1"  )      { return  "iPad 2 (WiFi)"}
    if (  pf   == "iPad2,2"  )      { return  "iPad 2 (GSM)"}
    if (  pf   == "iPad2,3"  )      { return  "iPad 2 (CDMA)"}
    if (  pf   == "iPad2,4"  )      { return  "iPad 2 (WiFi)"}
    if (  pf   == "iPad2,5"  )      { return  "iPad Mini (WiFi)"}
    if (  pf   == "iPad2,6"  )      { return  "iPad Mini (GSM)"}
    if (  pf   == "iPad2,7"  )      { return  "iPad Mini (GSM+CDMA)"}
    if (  pf   == "iPad3,1"  )      { return  "iPad 3 (WiFi)"}
    if (  pf   == "iPad3,2"  )      { return  "iPad 3 (GSM+CDMA)"}
    if (  pf   == "iPad3,3"  )      { return  "iPad 3 (GSM)"}
    if (  pf   == "iPad3,4"  )      { return  "iPad 4 (WiFi)"}
    if (  pf   == "iPad3,5"  )      { return  "iPad 4 (GSM)"}
    if (  pf   == "iPad3,6"  )      { return  "iPad 4 (GSM+CDMA)"}
    if (  pf   == "iPad4,1"  )      { return  "iPad Air (WiFi)"}
    if (  pf   == "iPad4,2"  )      { return  "iPad Air (Cellular)"}
    if (  pf   == "iPad4,4"  )      { return  "iPad mini 2G (WiFi)"}
    if (  pf   == "iPad4,5"  )      { return  "iPad mini 2G (Cellular)"}
    
    if (  pf   == "iPad4,7"  )      { return  "iPad mini 3 (WiFi)"}
    if (  pf   == "iPad4,8"  )      { return  "iPad mini 3 (Cellular)"}
    if (  pf   == "iPad4,9"  )      { return  "iPad mini 3 (China Model)"}
    
    if (  pf   == "iPad5,3"  )      { return  "iPad Air 2 (WiFi)"}
    if (  pf   == "iPad5,4"  )      { return  "iPad Air 2 (Cellular)"}
    
    if (  pf   == "AppleTV2,1"  )      { return  "AppleTV 2"}
    if (  pf   == "AppleTV3,1"  )      { return  "AppleTV 3"}
    if (  pf   == "AppleTV3,2"  )      { return  "AppleTV 3"}
    
    if (  pf   == "i386"  )         { return  "Simulator"}
    if (  pf   == "x86_64"  )       { return  "Simulator"}
    return  pf
}

extension String
{
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func getDateWithFormate(_ formate: String, timezone: String) -> Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        formatter.timeZone = TimeZone(abbreviation: timezone)
        
        return formatter.date(from: self)!
    }
    
}

extension UIImage
{
    
    func tintWithColor(_ color:UIColor)->UIImage
    {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale);
        //UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        
        // flip the image
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.translateBy(x: 0.0, y: -self.size.height)
        
        // multiply blend mode
        context?.setBlendMode(.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context?.fill(rect)
        
        // create uiimage
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    class func tintedImage(name:String)->UIImage{
        let origImage = UIImage(named: name)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        return tintedImage!
    }
    
}

extension UIImageView
{
    func setImage(_ image: UIImage, withColor color: UIColor)
    {
        self.image = image.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func startBlink() {
        UIView.animate(withDuration: 1,
                       delay:0.0,
                       options:[.autoreverse, .repeat],
                       animations: {
                        self.alpha = 0
        }, completion: nil)
    }
    
    func stopBlink() {
        alpha = 1
        layer.removeAllAnimations()
    }
    
    func flipAnimation(){
        UIView.transition(with: self, duration: 0.5, options:.transitionFlipFromRight, animations: { () -> Void in
            
            self.isHidden = false
        }, completion: { (Bool) -> Void in
            
        })
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2,completion:@escaping ()->Void) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = .identity
            }, completion: { (completed: Bool) -> Void in
                completion()
            })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    
}

extension Array where Element:Equatable
{
    func removeDuplicates() -> [Element]
    {
        var result = [Element]()
        
        for value in self
        {
            if result.contains(value) == false
            {
                result.append(value)
            }
        }
        
        return result
    }
}

extension Dictionary
{
    //https://developer.apple.com/swift/bprint/?id=12
    func valuesForKeys(_ keys: [Key]) -> [Value?]
    {
        return keys.map { self[$0] }
    }
    
    func valuesForKeys(_ keys: [Key], notFoundMarker: Value) -> [Value]
    {
        return self.valuesForKeys(keys).map { $0 ?? notFoundMarker }
    }
}


extension UISearchBar {
    
    private func getViewElement<T>(type: T.Type) -> T? {
        
        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
    
    func getSearchBarTextField() -> UITextField? {
        
        return getViewElement(type: UITextField.self)
    }
    
    func setTextColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            textField.textColor = color
        }
    }
    
    func setTextFieldColor(color: UIColor) {
        
        if let textField = getViewElement(type: UITextField.self) {
            switch searchBarStyle {
            case .minimal:
                textField.layer.backgroundColor = color.cgColor
                textField.layer.cornerRadius = 6
                
            case .prominent, .default:
                textField.backgroundColor = color
            }
        }
    }
    
    func setPlaceholderTextColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            textField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
    func setTextFieldClearButtonColor(color: UIColor) {
        
        if let textField = getSearchBarTextField() {
            
            let button = textField.value(forKey: "clearButton") as! UIButton
            if let image = button.imageView?.image {
                button.setImage(image.tintWithColor(color), for: .normal)
            }
        }
    }
    
    func setSearchImageColor(color: UIColor) {
        
        if let imageView = getSearchBarTextField()?.leftView as? UIImageView {
            imageView.image = imageView.image?.tintWithColor( color)
        }
    }
}

func getNSUserDefaultObjectForKey(_ key: String) -> AnyObject?
{
    return UserDefaults.standard.object(forKey: key) as AnyObject?
}

extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).deletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).deletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.appendingPathExtension(ext)
    }
}

//MARK: -
//MARK: Get library directory path

func getLibraryDirectoryPath() -> String
{
    var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [AnyObject]
    return paths[0] as! String
}

//MARK: Get document directory path

func getDocumentDirectoryStringPath() -> String
{
    var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [AnyObject]
    return paths[0] as! String
}



//MARK: Get file path from library directory

func getFilePathFromLibraryDirectory(_ fileName: String) -> String
{
    let filePath = getLibraryDirectoryPath().appendingFormat("/%@", fileName)
    
    return filePath
}

//MARK: Get file path from document directory

func getFilePathFromDocumentDirectory(_ fileName: String) -> String
{
    let filePath = getDocumentDirectoryStringPath().appendingFormat("/%@", fileName)
    
    return filePath
}

//MARK: Check for file exist or not

func isFileOrDirectoryExistAtPath(_ path: String) -> Bool
{
    let fileManager: FileManager = FileManager.default
    if fileManager.fileExists(atPath: path)
    {
        return true
    }
    return false
}

func createDirectoryFilePath(_ filePath: String) -> Bool
{
    do
    {
        try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
        return true
    }
    catch let error as NSError
    {
        print("Unable to create directory \(error)")
        return false
    }
}

//MARK: Create directory name at given path

func createDirectory(_ directoryName: String, atFilePath filePath: String) -> Bool
{
    let filePathAndDirectory: String = filePath.appendingFormat("/%@", directoryName)
    
    if isFileOrDirectoryExistAtPath(filePathAndDirectory)
    {
        return true
    }
    
    return createDirectoryFilePath(filePathAndDirectory)
}

//MARK: Create directory at library path

func createDirectoryAtLibraryDirectory(_ directoryName: String) -> Bool
{
    let filePathAndDirectory: String = getLibraryDirectoryPath().appendingFormat("/%@", directoryName)
    if isFileOrDirectoryExistAtPath(filePathAndDirectory)
    {
        return true
    }
    
    return createDirectoryFilePath(filePathAndDirectory)
}

//MARK: Create directory at document path

func createDirectoryAtDocumentDirectory(_ directoryName: String) -> Bool
{
    let filePathAndDirectory: String = getLibraryDirectoryPath().appendingFormat("/%@", directoryName)
    if isFileOrDirectoryExistAtPath(filePathAndDirectory)
    {
        return true
    }
    
    return createDirectoryFilePath(filePathAndDirectory)
}

//MARK: Get count of contents within directory path

func getCountOfContentsWithinDirectory(_ directoryPath: String) -> Int
{
    do
    {
        let contentArray = try FileManager.default.contentsOfDirectory(atPath: directoryPath)
        return contentArray.count
    }
    catch let error as NSError
    {
        print("Unable to get directory content \(error)")
        return 0
    }
}

//MARK: Delete path at given path

func deleteFileFromPath(_ filePath: String) -> Bool
{
    print("Path: %@", filePath)
    let fileManager: FileManager = FileManager.default
    
    do
    {
        try fileManager.removeItem(atPath: filePath)
        return true
    }
    catch let error as NSError
    {
        print("Delete directory error: \(error)")
        return false
    }
    
}

//MARK: Delete all files at given directory path

func deleteAllFilesAtDirectory(_ directoryPath: String) -> Bool
{
    print("Path: %@", directoryPath)
    
    let fileManager: FileManager = FileManager.default
    
    do
    {
        try fileManager.removeItem(atPath: directoryPath)
        let _ = createDirectoryFilePath(directoryPath)
        return true
    }
    catch let error as NSError
    {
        print("Delete directory error: \(error)")
        return false
    }
}

//MARK: Delete file with given search name at given directory path

func deleteFileNameStartWithText(_ searchText: String, atDirectory directory: String)
{
    let fileManager: FileManager = FileManager.default
    
    do
    {
        let dirContents: [String] = try fileManager.contentsOfDirectory(atPath: directory)
        
        for fileString: String in dirContents
        {
            if fileString.lowercased().hasPrefix(searchText.lowercased())
            {
                print("delete file = %@", fileString)
                let _ = deleteFileFromPath(directory.appendingFormat("/%@", fileString))
            }
        }
    }
    catch let error as NSError
    {
        print("Delete directory error: \(error)")
    }
}


func createGradiantLayer(topColor:UIColor,bottomColor:UIColor)->CAGradientLayer{
    var gl:CAGradientLayer!
    
    
    let colorTop = topColor.cgColor//UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
    let colorBottom = bottomColor.cgColor// UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
    
    gl = CAGradientLayer()
    gl.colors = [colorTop, colorBottom]
    
    gl.locations = [0.0, 1.0]
    
    return gl
}


func loadNib(name:String)->UINib{
    return UINib(nibName: name, bundle: Bundle.main)
}

func getLineCuttingText(text:String)->NSMutableAttributedString{
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    return attributeString
}

//MARK: Localize the strings
func localize(key:String)->String{
    return NSLocalizedString(key, comment: "")
}
