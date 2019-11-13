//
//  ScheduleDoctorController.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ScheduleDoctorController: UIViewController {

    @IBOutlet fileprivate var tableViewMR : UITableView!
    
    @IBOutlet weak var lbeNav: UILabel!
    @IBOutlet weak var lbeFilters: UILabel!
    @IBOutlet weak var lbeSortBy: UILabel!
    @IBOutlet weak var txtSearch: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func Cancel(_ sender: Any) {
        pressed()
    }
    
    func pressed()
    {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        
        for vc in viewControllers {
            if(vc is HomeController){
                self.navigationController!.popToViewController(vc, animated: true)
            }
            else {
                // self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    @IBAction func FiltersAction(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "GetCareController") as! GetCareController
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
//MARK: - TableViewDataSource Delegate
extension ScheduleDoctorController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1
        {
            return 4
        }
        else
        {
            return 4
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.white
        var label = UILabel(frame: CGRect(x: 24, y: 10, width: 300, height: 30))
        label.backgroundColor = UIColor.white
        label.textColor =  UIColor(red: 68.0/255.0, green: 60.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        label.font = UIFont(name: "CircularStd-Bold", size: 15)
        
        if section  == 0{
            label.text = "Doctors Recommended For You"
        }
        else{
            label = UILabel(frame: CGRect(x: 24, y: 0, width: 200, height: 30))
            label.backgroundColor = UIColor.clear
            label.textColor =  UIColor(red: 68.0/255.0, green: 60.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            label.font = UIFont(name: "CircularStd-Bold", size: 15)
            
            label.text = "Other Doctors"
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
            guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "DoctorsRecommendCell", for: indexPath) as? DoctorsRecommendCell else {
                return DoctorsRecommendCell()
            }
            cellOfProfile.selectionStyle = .none
            return cellOfProfile
        case 1:
            guard let cellOfUpcoming = tableView.dequeueReusableCell(withIdentifier: "DoctorsRecommendCell", for: indexPath) as? DoctorsRecommendCell else {
                return DoctorsRecommendCell()
            }
            cellOfUpcoming.selectionStyle = .none
            
            return cellOfUpcoming
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
//MARK: - TableViewDelegate Delegate
extension ScheduleDoctorController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       

        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SelectPlansVC") as! SelectPlansVC
        self.navigationController?.pushViewController(vc, animated: true)
        return
    }
    
    
}

