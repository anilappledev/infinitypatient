//
//  MedicalRecordController.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MedicalRecordController: UIViewController {

    @IBOutlet fileprivate var tableViewMR : UITableView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
//MARK: - TableViewDataSource Delegate
extension MedicalRecordController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1
        }
        else
        {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        if section == 0 {
           return vw
        }
        
        vw.backgroundColor = UIColor.white
        var label = UILabel(frame: CGRect(x: 25, y: 15, width: 200, height: 30))
        label.backgroundColor = UIColor.clear
        label.textColor = AppColor.AppPinkRGB
        if section  == 1{
            label.font = UIFont(name: "CircularStd-Bold", size: 15)

            label.text = "Medical History"
           
            let labelLine = UILabel(frame: CGRect(x: 24, y: 48, width:tableViewMR.frame.width - 48 , height: 1))
            
            labelLine.backgroundColor = AppColor.AppPinkRGB
            vw.addSubview(labelLine)
        }
        else{
            label = UILabel(frame: CGRect(x: 25, y: 28, width: 200, height: 30))
            label.backgroundColor = UIColor.clear
            label.textColor =  AppColor.AppPinkRGB
            label.font = UIFont(name: "CircularStd-Bold", size: 15)

            label.text = "E-Prescriptions "
        
            let labelLine = UILabel(frame: CGRect(x: 24, y: 63, width:tableViewMR.frame.width - 48 , height: 1))
            labelLine.backgroundColor = AppColor.AppPinkRGB
            vw.addSubview(labelLine)
            
            let labelLineBlue = UILabel(frame: CGRect(x: 17, y: 10, width:tableViewMR.frame.width - 34 , height: 2))
            labelLineBlue.backgroundColor = AppColor.AppBlueRGB
            vw.addSubview(labelLineBlue)
        }
        vw.addSubview(label)
        
        return vw
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0
        }
       else if  section == 1{
            return 60

        }
        else
        {
            return 74
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "AllergiesMedicalCell", for: indexPath) as? AllergiesMedicalCell else {
                return AllergiesMedicalCell()
            }
            cellOfProfile.selectionStyle = .none
            return cellOfProfile
        case 1:
            guard let cellOfUpcoming = tableView.dequeueReusableCell(withIdentifier: "MedicalCell", for: indexPath) as? MedicalCell else {
                return MedicalCell()
            }
            cellOfUpcoming.selectionStyle = .none
            cellOfUpcoming.lbeLineB.isHidden = false
            cellOfUpcoming.lbeLine1B.isHidden = false
            cellOfUpcoming.lbeLine2B.isHidden = false
            
            if indexPath.row == 1{
                cellOfUpcoming.lbeLineB.isHidden = true
                cellOfUpcoming.lbeLine1B.isHidden = true
                cellOfUpcoming.lbeLine2B.isHidden = true

            }
            
            cellOfUpcoming.lbedrug.numberOfLines = 1;
            cellOfUpcoming.lbedrug.adjustsFontSizeToFitWidth = true
            return cellOfUpcoming
            
        case 2:
            guard let cellOfPrescriptions = tableView.dequeueReusableCell(withIdentifier: "PrescriptionsCell", for: indexPath) as? PrescriptionsCell else {
                return PrescriptionsCell()
            }
            cellOfPrescriptions.selectionStyle = .none
            cellOfPrescriptions.lbeLineB.isHidden = false
            cellOfPrescriptions.lbeLine1B.isHidden = false
            cellOfPrescriptions.lbeLine2B.isHidden = false
            
            if indexPath.row == 1{
                cellOfPrescriptions.lbeLineB.isHidden = true
                cellOfPrescriptions.lbeLine1B.isHidden = true
                cellOfPrescriptions.lbeLine2B.isHidden = true
            }
            
            
            cellOfPrescriptions.lbedrug.numberOfLines = 1;
            cellOfPrescriptions.lbedrug.adjustsFontSizeToFitWidth = true
            
            return cellOfPrescriptions
            
        default:
            return UITableViewCell()
        }
        
    }
}


//MARK: - TableViewDelegate Delegate
extension MedicalRecordController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 105
        }
        
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            
            return
        default :
            return
        }
    }
    
    
}
