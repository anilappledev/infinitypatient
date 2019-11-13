//
//  ForgetPassController.swift
//  TelemedPatient
//
//  Created by dr.mac on 25/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class ForgetPassController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet weak var lbeForgetPass: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUser.delegate = self
        txtEmail.delegate = self
    }
    
    @IBAction func Close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func Send(_ sender: Any) {
        ChangePassValidation()
        
        
    }
    
    //MARK: -  Forget Pass Validation --
    
    func ChangePassValidation(){
        
        let userText = txtUser.text ?? ""
        let emailText = txtEmail.text ?? ""
        
        
        if userText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in User Name Field")
            
            return
        }
        if emailText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Email Field")
            
            return
        }
        
        if !emailText.EmailValidation()
        {
            self.showErrorMSg(text: "Please enter Correct Email ID")
            
            return
        }
        
    
        AlertView.backButtonAction(title: "Alert", "Please check your Email Account.", self)

        
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
