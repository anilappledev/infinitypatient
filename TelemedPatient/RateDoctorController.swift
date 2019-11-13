//
//  RateDoctorController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import Cosmos

class RateDoctorController: UIViewController {

    @IBOutlet weak var RatingVw: CosmosView!

    @IBOutlet weak var lbeNav: UILabel!
    
    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    @IBOutlet weak var lbeDes: UILabel!
    
    @IBOutlet weak var lbeRevData: UILabel!
    
    
   
    @IBOutlet weak var lbeRev: UILabel!
    
    @IBOutlet weak var lbeDatiles: UILabel!
    @IBOutlet weak var lbeDoctorName: UILabel!
    
    @IBOutlet weak var lbeLangData: UILabel!
    
    @IBOutlet weak var lbeLang: UILabel!
    
    @IBOutlet weak var btnRating: UIButtonX!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func Rate(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
