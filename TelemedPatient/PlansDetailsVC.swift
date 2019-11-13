//
//  PlansDetailsVC.swift
//  TelemedPatient
//
//  Created by dr.mac on 24/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PlansDetailsVC: UIViewController {

    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var lbeTitle: UILabel!

    var strPlaneName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if strPlaneName == "Infinity Health"{
            
            viewTop.backgroundColor = UIColor.white
            lbeTitle.textColor = UIColor(red: 68.0/255.0, green: 60.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            lbeTitle.text = "INFINITY HEALTH"
        }
        else if (strPlaneName == "On Demand"){
             viewTop.backgroundColor = UIColor(red: 0.0/255.0, green: 177.0/255.0, blue: 63.0/255.0, alpha: 1.0)
            lbeTitle.textColor = UIColor.white
            
            lbeTitle.text = "ON DEMAND"

        }
        else{
             viewTop.backgroundColor = UIColor(red: 255.0/255.0, green: 225.0/255.0, blue: 80.0/255.0, alpha: 1.0)
            lbeTitle.textColor = UIColor(red: 68.0/255.0, green: 60.0/255.0, blue: 252.0/255.0, alpha: 1.0)
            
            lbeTitle.text = "INFINITY GLOBAL"

        }
        

    }
    
    //MARK: -  @IBAction
    
    @IBAction func Accept(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PatientHistoryController") as! PatientHistoryController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func Close(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        
    }
   

}
