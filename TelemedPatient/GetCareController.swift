//
//  GetCareController.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import DropDown
class GetCareController: UIViewController {

    @IBOutlet weak var lbeNav: UILabel!
    
    @IBOutlet weak var lbeSpecialty: UILabel!
    @IBOutlet weak var lbeSubSpecialty: UILabel!
    @IBOutlet weak var lbeLang: UILabel!
    @IBOutlet weak var lbeLocation: UILabel!
    @IBOutlet weak var lbeNationality: UILabel!


    @IBOutlet weak var txtNationality: UITextField!
    @IBOutlet weak var txtSpecialty: UITextField!
    @IBOutlet weak var txtSubSpecialty: UITextField!
    @IBOutlet weak var txtLang: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtSearch: UITextField!

    
    @IBOutlet weak var btnSpeciality: UIButton!
    @IBOutlet weak var btnSubSpeciality: UIButton!
    @IBOutlet weak var btnLang: UIButton!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnNationality: UIButton!


    let dropSpeciality = DropDown()
    let dropSubSpeciality = DropDown()
    let dropLang = DropDown()
    let dropLocation = DropDown()
    let dropNationality = DropDown()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDowns()
        
       
        
//        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: UITextInputMode.currentInputModeDidChangeNotification, object: nil)

        
    }
    
    @objc func onDidReceiveData(_ notification:Notification) {

//       print("YES")
//        let language = txtSearch.textInputMode?.primaryLanguage
//        print(language as Any)
//
//        if let language = self.textInputMode?.primaryLanguage {
//            txtSearch.textAlignment = .right
//        } else {
//            txtSearch.textAlignment = .left
//        }

    }
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
     @IBAction func Search(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ScheduleDoctorController") as! ScheduleDoctorController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
     @IBAction func Speciality(_ sender: Any) {
        
        dropSpeciality.show()
    }
    @IBAction func SubSpeciality(_ sender: Any) {
        
        dropSubSpeciality.show()
    }
    @IBAction func Lang(_ sender: Any) {
        
        dropLang.show()
    }
    @IBAction func Location(_ sender: Any) {
        
        dropLocation.show()
    }
    @IBAction func Nationality(_ sender: Any) {
        
        dropNationality.show()
    }
    
    
    func setupDropDowns() {
        setupSpecialityDropDown()
        setupSubSpecialityDropDown()
        setupLangDropDown()
        setupLocationDropDown()
        setupNationalDropDown()
    }
    
    
    func setupSpecialityDropDown() {
        
        dropSpeciality.anchorView = btnSpeciality
        dropSpeciality.bottomOffset = CGPoint(x: 0, y: btnSpeciality.bounds.height)

        dropSpeciality.dataSource = [
            "Dermotologiest",
            "Internal Medical",
            "Primary Care"

        ]
        
       
        dropSpeciality.selectionAction = { [weak self] (index, item) in
            self!.txtSpecialty.text = item
        }
    }
    
    func setupSubSpecialityDropDown() {
        dropSubSpeciality.anchorView = btnSubSpeciality
        dropSubSpeciality.bottomOffset = CGPoint(x: 0, y: btnSubSpeciality.bounds.height)
        
        dropSubSpeciality.dataSource = [
            "Primary Care"
        ]
        
        
        dropSubSpeciality.selectionAction = { [weak self] (index, item) in
            self!.txtSubSpecialty.text = item
        }
    }
    
    func setupLangDropDown() {
        dropLang.anchorView = btnLang
        dropLang.bottomOffset = CGPoint(x: 0, y: btnLang.bounds.height)
        
        dropLang.dataSource = [
            "English",
            "Spanish",
            "Portuguese"
            
        ]
        
        
        dropLang.selectionAction = { [weak self] (index, item) in
            self!.txtLang.text = item
        }
    }
    
    
    func setupLocationDropDown() {
        dropLocation.anchorView = btnLocation
        dropLocation.bottomOffset = CGPoint(x: 0, y: btnLocation.bounds.height)
        
        dropLocation.dataSource = [
            "Australia",
            "Austria",
            "Spaine"
            
        ]
        
        
        dropLocation.selectionAction = { [weak self] (index, item) in
            self!.txtLocation.text = item
        }
    }
    func setupNationalDropDown() {
        dropNationality.anchorView = btnNationality
        dropNationality.bottomOffset = CGPoint(x: 0, y: btnNationality.bounds.height)
        
        dropNationality.dataSource = [
            "Australia",
            "Austria",
            "Spaine"
            
        ]
        
        
        dropNationality.selectionAction = { [weak self] (index, item) in
            self!.txtNationality.text = item
        }
    }

}
