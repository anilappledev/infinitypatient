//
//  SymptomSearchController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class SymptomSearchController: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtSearch.becomeFirstResponder()
    }
    

   
    //MARK: -  @IBAction
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func GetCare(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GetCareController") as! GetCareController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
