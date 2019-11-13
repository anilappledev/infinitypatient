//
//  ChangePasswordController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ChangePasswordController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtOld: UITextField!
    @IBOutlet weak var txtNew: UITextField!
    @IBOutlet weak var txtRetype: UITextField!


    @IBOutlet weak var lbeNav: UILabel!

    @IBOutlet weak var btnSave: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        txtOld.delegate = self
        txtNew.delegate = self
        txtRetype.delegate = self


    }
    

    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
     @IBAction func Forget(_ sender: Any) {
        
    }
    @IBAction func Save(_ sender: Any) {
        ChangePassValidation()
    }
    
    
    //MARK: -  Change Pass Validation --
    
    func ChangePassValidation(){
        
        let oldText = txtOld.text ?? ""
        let newText = txtNew.text ?? ""
        let retypeText = txtRetype.text ?? ""
        
        
        if oldText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current Password Field")
            
            return
        }
        else if newText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in New Password Field")
            
            return
        }
        else if !(newText.PasswordValidationCheck())
        {
            self.showErrorMSg(text: "Required minimum 6 characters at least 1 Alphabet, 1 Number and 1 Special Character")
            return
        }
        else if newText.count < 6{
            self.showErrorMSg(text: "Required minimum 6 Characters")
        }
        else if retypeText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Retype New Password Field")
            
            return
        }
        else if newText != retypeText
        {
            self.showErrorMSg(text: "Both password not Match")
            return
        }
        
        AlertView.backButtonAction(title: "Alert", "Password Updated Successfully", self)
    
}
    
    func showErrorMSg(text : String)
    {
        AlertView.oneButtonAction(title: "Oops!", text, self)

    }
    
    //MARK: - textField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " " {
            return false
        }
        return true
    }
    
    //MARK: - touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
