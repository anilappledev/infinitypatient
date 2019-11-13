//
//  SignUpController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class SignUpController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConPassword: UITextField!
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet weak var lbeSignUp: UILabel!
    @IBOutlet weak var lbePleaseCom: UILabel!

    @IBOutlet weak var viewTap: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
         txtEmail.delegate = self
         txtPassword.delegate = self
         txtConPassword.delegate = self
         viewAddTap()
        
    }
    

    
    //MARK: -  @IBAction
    
    @IBAction func SignUp(_ sender: Any) {
       
        
        SignUpValidation()
    }
    
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    //MARK: -  Login Validation --
    
    func SignUpValidation(){
        
        let emailText = txtEmail.text ?? ""
        let passWordText = txtPassword.text ?? ""
        let conPassword = txtConPassword.text ?? ""
        
        if emailText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Email Field")
            
            return
        }
        
        else if !emailText.EmailValidation()
        {
            self.showErrorMSg(text: "Please enter Correct Email ID")
            
            return
        }
        
       else if passWordText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Password Field")
            
            return
        }
        else if !(passWordText.PasswordValidationCheck())
        {
            self.showErrorMSg(text: "Required minimum 6 characters at least 1 Alphabet, 1 Number and 1 Special Character")
            return
        }
        else if passWordText.count < 6{
             self.showErrorMSg(text: "Required minimum 6 Characters")
             return
        }
        else if conPassword.isEmpty
        {
            self.showErrorMSg(text: "Please enter Confirm Password Field")
            return
        }
        else if passWordText != conPassword
        {
            self.showErrorMSg(text: "Both password not Match")
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpContinueController") as! SignUpContinueController
        vc.userEmailString = emailText
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func viewAddTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewTap.addGestureRecognizer(tap)

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
          self.view.endEditing(true)
    }

}
