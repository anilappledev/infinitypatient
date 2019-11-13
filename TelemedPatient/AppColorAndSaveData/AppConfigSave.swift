//
//  AppConfigSave.swift
//  TelemedPatient
//
//  Created by dr.mac on 09/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AppConfigSave: NSObject {

}

class AppColor: NSObject {
    
    
    // rgb(68,60,252)

    static let AppBlueRGB : UIColor = UIColor( red: CGFloat(68/255.0), green: CGFloat(60/255.0), blue: CGFloat(252/255.0), alpha: CGFloat(1.0) )
    
  
    
   // rgb(176,173,254)
    
    static let AppLightBlueRGB : UIColor = UIColor( red: CGFloat(176/255.0), green: CGFloat(173/255.0), blue: CGFloat(254/255.0), alpha: CGFloat(1.0) )
    
     // rgb(233,65,86)
    static let AppPinkRGB : UIColor = UIColor( red: CGFloat(233/255.0), green: CGFloat(65/255.0), blue: CGFloat(86/255.0), alpha: CGFloat(1.0) )
    
    
    
     // Placeholder Color
    // rgb(68,60,252) 40
    
    static let AppPlaceholder : UIColor = UIColor( red: CGFloat(68/255.0), green: CGFloat(60/255.0), blue: CGFloat(252/255.0), alpha: CGFloat(0.4) )
    
}

//MARK:-   Store Data Model

class StoreUserData : NSObject
{
    // MARK: - AccessToken --
    static func saveAccessToken(_ value: String){
        UserDefaults.standard.set(value, forKey:"AccessToken")
    }
    static func getAccessToken()-> String {
        return (UserDefaults.standard.value(forKey: "AccessToken") as? String ?? "")
    }
    
    
    // MARK: - UserID --
    static func saveUserID(_ value: String){
        UserDefaults.standard.set(value, forKey:"UserID")
    }
    static func getUserID()-> String {
        return (UserDefaults.standard.value(forKey: "UserID") as? String ?? "")
    }
    
    // MARK: - UserName --
    static func saveUserName(_ value: String){
        UserDefaults.standard.set(value, forKey:"UserName")
    }
    static func getUserName()-> String {
        return (UserDefaults.standard.value(forKey: "UserName") as? String ?? "")
    }
    
    // MARK: - UserImage --
    static func saveUserImage(_ value: String){
        UserDefaults.standard.set(value, forKey:"UserImage")
    }
    static func getUserImage()-> String {
        return (UserDefaults.standard.value(forKey: "UserImage") as? String ?? "")
    }
    
}


//MARK:-   Clear Data Model

class ClearUserData : NSObject
{
    static func clearAccessToken(){
        UserDefaults.standard.removeObject(forKey: "AccessToken")
    }
    static func clearUserID(){
        UserDefaults.standard.removeObject(forKey: "UserID")
    }
    static func clearUserName(){
        UserDefaults.standard.removeObject(forKey: "UserName")
    }
    static func clearUserImage(){
        UserDefaults.standard.removeObject(forKey: "UserImage")
    }
}

//MARK:-   AlertView  Model

class AlertView : NSObject
{
    
    static func oneButtonAction(title:String, _ message:String, _ view:UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        view.present(alert, animated: true, completion: nil)
    }
    
    static func backButtonAction(title:String, _ message:String, _ view:UIViewController){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            view.navigationController?.popViewController(animated: true)

        }
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
            
            
    }
    
}

//MARK:-   LogoutAlertView  Model

class LogoutAlertView : NSObject
{
    static func showLogout(view:UIViewController){

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let window = appDelegate?.window


        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to Logout?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.isNavigationBarHidden = true
    
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
    
    
        }
        let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        view.present(alertController, animated: true, completion: nil)
        
    }
}
