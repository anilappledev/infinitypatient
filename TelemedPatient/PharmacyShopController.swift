//
//  PharmacyShopController.swift
//  TelemedPatient
//
//  Created by dr.mac on 19/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PharmacyShopController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CheckOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PharmacyDeliverController") as! PharmacyDeliverController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
