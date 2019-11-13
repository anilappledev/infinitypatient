//
//  HomeController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    
    @IBOutlet weak var HomeTableView: UITableView!
    
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    
    @IBOutlet weak var lbeListShow: UILabel!
    @IBOutlet weak var lbeHello: UILabel!
    @IBOutlet weak var lbeHide: UILabel!

    @IBOutlet weak var btnGetCare: UIButton!

    @IBOutlet weak var imgView: UIImageView!


    
    var objectHome = Dashboard()
    
    var isList = Bool()
    
    var strMoreList = String()


    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setGradientBackground()
        getData()
        
        
        strMoreList = "YES"
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height - 320 - 60
        if  screenHeight < 360{
            heightConst.constant = screenHeight
        }
        else{
            heightConst.constant = 360
        }
        HomeTableView.reloadData()
        isList = true
        
    }
    //MARK:-   get Data Function
    func getData(){
        objectHome.imagesTitle = ["Sy","Health","Plan","Reco","privacyIcon","contet","AboutUs","hSetting","logout"]
        objectHome.title = ["My Symptoms","My Health","My Plan","My Medical Records","Privacy Policy","Contact Us","About Us","Setting","Logout"]
        
    }
    
    //MARK: -  @IBAction
    
    @IBAction func GetCare(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GetCareController") as! GetCareController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func HideList(_ sender: Any) {
        
        if isList {
            heightConst.constant = 160
            strMoreList  = "NO"
            UIView.animate(withDuration: 0.4, animations: {
                 self.view.layoutIfNeeded()
            })
            HomeTableView.reloadData()
            isList = false
            lbeListShow.text = "Show"
            imgView.image = UIImage (named: "downArrowG")


        }
        else{
            
            let screenSize = UIScreen.main.bounds
            let screenHeight = screenSize.height - 320 - 60
            
            if  screenHeight < 360{
                heightConst.constant = screenHeight

            }
            else{
                heightConst.constant = 360

            }
            
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
            
            strMoreList  = "YES"
            HomeTableView.reloadData()
            isList = true
            lbeListShow.text = "Hide"
            imgView.image = UIImage (named: "upArrowG")


        }
        
    }
    
    
    
    func setGradientBackground() {
          let colorTop =  UIColor(red: 57.0/255.0, green: 51.0/255.0, blue: 239.0/255.0, alpha: 1.0).cgColor
        
          let colorMiddle = UIColor(red: 68.0/255.0, green: 59.0/255.0, blue: 252.0/255.0, alpha: 1.0).cgColor
        
          let colorBottom = UIColor(red: 61.0/255.0, green: 82.0/255.0, blue: 252.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorMiddle,colorBottom]
        gradientLayer.locations = [0.0,0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    

}
//MARK: - TableViewDataSource Delegate
extension HomeController : UITableViewDataSource, UITableViewDelegate
{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if strMoreList == "NO" {
           return 4
        }
        else{
            return objectHome.title.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellHome = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return HomeTableViewCell()
        }
        cellHome.selectionStyle = .none
        cellHome.lbeTitle.text = objectHome.title[indexPath.row]
        if indexPath.row < 4 {
           
            cellHome.img.image  =  UIImage (named: objectHome.imagesTitle[indexPath.row])
            cellHome.lbeTitle.textColor =  UIColor.white
            cellHome.img.alpha = 1
        }
        else{
           
            
            cellHome.img.image  =  UIImage (named: objectHome.imagesTitle[indexPath.row])
            cellHome.lbeTitle.textColor =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.3)
            cellHome.img.alpha = 0.5

        }
        
        
        return cellHome
       
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
            return 40
       
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "SymptomSearchController") as! SymptomSearchController
           self.navigationController?.pushViewController(vc, animated: true)
           
            return
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MyHealthController") as! MyHealthController
            self.navigationController?.pushViewController(vc, animated: true)
            return
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MedicalRecordController") as! MedicalRecordController
            self.navigationController?.pushViewController(vc, animated: true)
            return
            
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyController") as! PrivacyPolicyController
            self.navigationController?.pushViewController(vc, animated: true)
            return
            
        case 5:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
            vc.strTitle = "Contact Us"
            self.navigationController?.pushViewController(vc, animated: true)
             return
        case 6:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
            vc.strTitle = "About Us"
            self.navigationController?.pushViewController(vc, animated: true)
            return
            
        case 7:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
            self.navigationController?.pushViewController(vc, animated: true)
            return
            
            
        case 8:
            
              LogoutAlertView.showLogout(view: self)
            
            return
        default :
            return
        }
    }
    
    
    
    
  
    
}

