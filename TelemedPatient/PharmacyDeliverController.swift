//
//  PharmacyDeliverController.swift
//  TelemedPatient
//
//  Created by dr.mac on 20/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PharmacyDeliverController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
}
