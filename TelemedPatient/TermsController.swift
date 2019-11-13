//
//  TermsController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class TermsController: UIViewController {
    
    var strTitle = String()
    @IBOutlet weak var lbeTitle: UILabel!
    @IBOutlet weak var txtView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.isScrollEnabled = false

        lbeTitle.text = strTitle
    }
    override func viewDidAppear(_ animated: Bool) {
        txtView.isScrollEnabled = true
    }

    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
