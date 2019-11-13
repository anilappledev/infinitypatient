//
//  AppointmentDatialsController.swift
//  TelemedPatient
//
//  Created by dr.mac on 14/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class AppointmentDatialsController: UIViewController {

    
    @IBOutlet weak var lbeTitle: UILabel!
    
    var strTitle = String()

    override func viewDidLoad() {
        super.viewDidLoad()

         lbeTitle.text = strTitle
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   

}
