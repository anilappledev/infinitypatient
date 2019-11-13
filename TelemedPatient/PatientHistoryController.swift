//
//  PatientHistoryController.swift
//  TelemedPatient
//
//  Created by dr.mac on 19/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PatientHistoryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func Continue(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookAppointmentController") as! BookAppointmentController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
