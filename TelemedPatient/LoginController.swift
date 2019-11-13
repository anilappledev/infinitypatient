//
//  LoginController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForget: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lbeNotUser: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        langChangeAll_Text()
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    //MARK: -  @IBAction
    
    @IBAction func Login(_ sender: Any) {
        
        loginValidation()
        
      
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func ForgotPassword(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForgetPassController") as! ForgetPassController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: -  Login Validation --
    
    func loginValidation(){
        
        let emailText = txtEmail.text ?? "Test@gmail.com"
        let passWordText = txtPassword.text ?? "123456"
        
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
        
        if passWordText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Password Field")
            
            return
        }
//        else if !(passWordText.PasswordValidationCheck())
//        {
//            self.showErrorMSg(text: "Required minimum 6 characters at least 1 Alphabet, 1 Number and 1 Special Character")
//            return
//        }
//
       loginUserAPI()
    }
    
    //MARK: -  Login Data API Call --
    
    func loginUserAPI(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "IntroAppController") as! IntroAppController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        txtEmail.text = ""
        txtPassword.text = ""
        
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
    
    
    
    func langChangeAll_Text()  {
        
        
       
        txtEmail.attributedPlaceholder = NSAttributedString(string: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Email", comment: ""),
                                                               attributes: [NSAttributedString.Key.foregroundColor: AppColor.AppPlaceholder])
        
        
        txtPassword.attributedPlaceholder = NSAttributedString(string: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password", comment: ""),
                                                            attributes: [NSAttributedString.Key.foregroundColor: AppColor.AppPlaceholder])
        
        
        
        
        var login = String()
        var Forget = String()
        var SignUp = String()
  
        login = LocalizationSystem.sharedInstance.localizedStringForKey(key: "LogIn", comment: "")
        
         Forget = LocalizationSystem.sharedInstance.localizedStringForKey(key: "I forgot my password", comment: "")
         SignUp = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Sign Up", comment: "")
        
        
        btnLogin.setTitle(login, for: .normal)
        btnForget.setTitle(Forget, for: .normal)
        btnSignUp.setTitle(SignUp, for: .normal)


        lbeNotUser.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Not a User?", comment: "")
    }
    
}
