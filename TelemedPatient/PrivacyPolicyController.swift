//
//  PrivacyPolicyController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PrivacyPolicyController: UIViewController {

    @IBOutlet weak var lbeNav: UILabel!

    
    @IBOutlet weak var txtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtView.isScrollEnabled = false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtView.isScrollEnabled = true
    }
    
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func Accpet(_ sender: Any) {
        
        
    }
   

}
