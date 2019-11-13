//
//  ConfirmBookingController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ConfirmBookingController: UIViewController {

    
    @IBOutlet weak var lbeDoctorName: UILabel!
    @IBOutlet weak var lbeDoctorSp: UILabel!
    
    @IBOutlet weak var lbeRew: UILabel!
    @IBOutlet weak var lbeRewData: UILabel!

    @IBOutlet weak var lbeLangData: UILabel!


    @IBOutlet weak var lbeLang: UILabel!
    @IBOutlet weak var lbeDoYou: UILabel!
    
    @IBOutlet weak var btnConf: UIButton!
    @IBOutlet weak var btnRedial: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet weak var lbeInfoData: UILabel!
    
    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Confram(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoCallController") as! VideoCallController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func Cancel(_ sender: Any) {
        
        
    }
    @IBAction func Redial(_ sender: Any) {
        
        
    }

    @IBAction func Close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func RateDoc(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RateDoctorController") as! RateDoctorController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
