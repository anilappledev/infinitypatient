//
//  VideoCallController.swift
//  TelemedPatient
//
//  Created by dr.mac on 20/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class VideoCallController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: Any) {
            pressed()
        
    }
   
    
    @IBAction func Continue(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "PharmacyShopController") as! PharmacyShopController
//        self.navigationController?.pushViewController(vc, animated: true)
        
        pressed()
        
    }

    func pressed()
    {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        
        for vc in viewControllers {
            if(vc is HomeController){
                self.navigationController!.popToViewController(vc, animated: true)
            }
            else {
               // self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
