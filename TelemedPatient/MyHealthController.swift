//
//  MyHealthController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MyHealthController: UIViewController {

    
    @IBOutlet fileprivate var tableViewMyH : UITableView!

    @IBOutlet weak var lbeNav: UILabel!
    @IBOutlet weak var lbeUserName: UILabel!
    @IBOutlet weak var lbeUserDes: UILabel!
    @IBOutlet weak var lbeProfile: UILabel!
    @IBOutlet weak var lbeAge: UILabel!
    @IBOutlet weak var lbeAgeData: UILabel!
    @IBOutlet weak var lbeGenderData: UILabel!
    @IBOutlet weak var lbeGender: UILabel!
    @IBOutlet weak var lbeHeightData: UILabel!
    @IBOutlet weak var lbeHeight: UILabel!
    @IBOutlet weak var lbeWeight: UILabel!
    @IBOutlet weak var lbeWeightData: UILabel!
    @IBOutlet weak var lbeRewData: UILabel!
    @IBOutlet weak var lbeRew: UILabel!
    @IBOutlet weak var lbeMediRec: UILabel!
    
    @IBOutlet weak var btnEdit: UIButton!





    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()

    }
    
    //MARK: -  @IBAction
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func MedicalRecords(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MedicalRecordController") as! MedicalRecordController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setGradientBackground() {
//        let colorTop =  UIColor(red: 244.0/255.0, green: 91.0/255.0, blue: 105.0/255.0, alpha: 1.0).cgColor
//
//        let colorBottom = UIColor(red: 237.0/255.0, green: 66.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop,colorBottom]
//        gradientLayer.locations = [0.0,1.0]
//        gradientLayer.frame = self.view.bounds
//
      //  self.view.layer.insertSublayer(gradientLayer, at:0)
        
        self.view.backgroundColor = AppColor.AppPinkRGB
    }
    
    
}
//MARK: - TableViewDataSource Delegate
extension MyHealthController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1
        {
            return 3
        }
        else
        {
            return 2
        }
    }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = AppColor.AppPinkRGB
        var label = UILabel(frame: CGRect(x: 24, y: 10, width: 200, height: 30))
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.font = UIFont(name: "CircularStd-Bold", size: 15)
        
        if section  == 0{
            label.text = "Upcoming Appointments"
        }
        else{
            label = UILabel(frame: CGRect(x: 24, y: 0, width: 200, height: 30))
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.white
            label.font = UIFont(name: "CircularStd-Bold", size: 15)
            
            label.text = "History"
        }
        vw.addSubview(label)

        return vw
    }
    
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 40
        }
        else
        {
            return 27
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "UpcomingBookingCell", for: indexPath) as? UpcomingBookingCell else {
                return UpcomingBookingCell()
            }
            cellOfProfile.selectionStyle = .none
            return cellOfProfile
        case 1:
            guard let cellOfUpcoming = tableView.dequeueReusableCell(withIdentifier: "UpcomingBookingCell", for: indexPath) as? UpcomingBookingCell else {
                return UpcomingBookingCell()
            }
            cellOfUpcoming.selectionStyle = .none
            
            return cellOfUpcoming
     
        default:
            return UITableViewCell()
        }
        
    }
}


//MARK: - TableViewDelegate Delegate
extension MyHealthController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if DeviceType.IS_IPHONE_5 {
            return 100
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AppointmentDatialsController") as! AppointmentDatialsController
            
            vc.strTitle = "Your Upcoming Appointment"
            self.navigationController?.pushViewController(vc, animated: true)
            
            return
        default :
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AppointmentDatialsController") as! AppointmentDatialsController
            
            vc.strTitle = "Your Appointment"
            self.navigationController?.pushViewController(vc, animated: true)
            
            return
        }
    }
    
    
}
