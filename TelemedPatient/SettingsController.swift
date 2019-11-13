//
//  SettingsController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var lbeNav: UILabel!
    @IBOutlet weak var lbeNotif: UILabel!
    @IBOutlet weak var lbeLangTitle: UILabel!
    @IBOutlet weak var lbeChangePass: UILabel!
    @IBOutlet weak var lbeTerms: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction fileprivate func languageBtn(_ sender : UIButton)
    {
        languageSheet()
    }
    
    @IBAction fileprivate func ChangePassBtn(_ sender : UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction fileprivate func TermsBtn(_ sender : UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
        vc.strTitle = "Terms and Conditions"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    fileprivate func languageSheet()
    {
        self.popupAlertWithSheet(title: "TeleMed", message: "Select your Language", actionTitles: ["English","Spanish","Portuguese"], actions: [{ action1 in
            
                self.langChange("English")
            },{action2 in
               
                self.langChange("Spanish")

            },{ action3 in
                self.langChange("Portuguese")

            },nil])
    }
    
    
    func langChange(_ stringLang: String) {
        
      
        let alertController = UIAlertController(title: "Language!", message: "To changing language you need to restart application, do you want to restart?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            if stringLang == "Spanish"{
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "es")
            }
           else if stringLang == "Portuguese"{
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "es")
            }
            else{
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")

            }
            self.languageName?.text = stringLang
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            let navigationController = UINavigationController(rootViewController: nextViewController)
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = navigationController
            
           
            
        }
        let cancelAction = UIAlertAction(title: "Restart later", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
