//
//  SignUpContinueController.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import DropDown

class SignUpContinueController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDateBirth: UITextField!
    @IBOutlet weak var txtBirthCity: UITextField!
    @IBOutlet weak var txtBirthCountry: UITextField!
    @IBOutlet weak var txtCurrentAddress: UITextField!
    @IBOutlet weak var txtCurrentCity: UITextField!
    @IBOutlet weak var txtCurrentState: UITextField!
    @IBOutlet weak var txtCurrentCountry: UITextField!
    @IBOutlet weak var txtPost: UITextField!
    @IBOutlet weak var txtGender: UITextField!

    
    @IBOutlet weak var lbeSignUp: UILabel!
    @IBOutlet weak var lbeInfo: UILabel!
    @IBOutlet weak var lbeName: UILabel!
    @IBOutlet weak var lbeSurName: UILabel!
    @IBOutlet weak var lbeEmail: UILabel!
    @IBOutlet weak var lbeDateBirth: UILabel!
    @IBOutlet weak var lbeBirthCity: UILabel!
    @IBOutlet weak var lbeBirthCountry: UILabel!
    @IBOutlet weak var lbeCurrentAddress: UILabel!
    @IBOutlet weak var lbeCurrentCity: UILabel!
    @IBOutlet weak var lbeCurrentState: UILabel!
    @IBOutlet weak var lbeCurrentCountry: UILabel!
    @IBOutlet weak var lbePost: UILabel!
    @IBOutlet weak var lbeTream: UILabel!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnGender: UIButton!


    @IBOutlet weak var lbePriv: UILabel!
    @IBOutlet weak var imgVwChe: UIImageView!

    @IBOutlet weak var lbeRead: UILabel!
    
    @IBOutlet weak var lbeAnd: UILabel!
    var dateText = Date()
    var userEmailString = String()
    var isSelect = Bool()
    
    let dropGender = DropDown()


    override func viewDidLoad() {
        super.viewDidLoad()
        DropDown.appearance().backgroundColor = AppColor.AppPinkRGB
        DropDown.appearance().selectionBackgroundColor = AppColor.AppPinkRGB
        DropDown.appearance().cornerRadius = 10
        DropDown.appearance().textColor = UIColor.white
        
        setGradientBackground()
        setupGenderDropDown()
        
        self.txtEmail.text = userEmailString
        txtName.becomeFirstResponder()
       

    }
    

    //MARK: -  @IBAction
    
    func setupGenderDropDown() {
        
        dropGender.anchorView = txtGender
        dropGender.bottomOffset = CGPoint(x: 0, y: btnGender.bounds.height)
        
        dropGender.dataSource = [
            "Male",
            "Female",
            "Other"
            
        ]
        
        
        dropGender.selectionAction = { [weak self] (index, item) in
            self!.txtGender.text = item
        }
    }
    
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        SignUpValidation()
        
    }
    
  
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    @IBAction func DateOfBirth(_ sender: Any) {
        self.view.endEditing(true)
        addPicker()

    }
    
      @IBAction func Gender(_ sender: Any) {
        dropGender.show()

        
    }
    
     @IBAction func Treams(_ sender: Any) {
        self.view.endEditing(true)
        imgVwChe.image = UIImage (named: "checkWhite")
        isSelect = true
     }
    
    @IBAction func TreamsViewOpen(_ sender: Any) {
        self.view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TermsController") as! TermsController
        vc.strTitle = "Terms and Conditions"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func PrivayViewOpen(_ sender: Any) {
        self.view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyController") as! PrivacyPolicyController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: -  Login Validation --
    
    func SignUpValidation(){
        
        let nameText = txtName.text ?? ""
        let surNameText = txtSurName.text ?? ""
        let dbText = txtDateBirth.text ?? ""
        let birthCity = txtBirthCity.text ?? ""
        let birthCountry = txtBirthCountry.text ?? ""
        let CurrentAddress  = txtCurrentAddress.text ?? ""
        let CurrentCity = txtCurrentCity.text ?? ""
        let CurrentState = txtCurrentState.text ?? ""
        let CurrentCountry = txtCurrentCountry.text ?? ""
        let postcode = txtPost.text ?? ""
        let emailText = txtEmail.text ?? ""
        let gender = txtGender.text ?? ""

        
        if nameText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Name Field")
            
            return
        }
        else if surNameText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Surname Field")
            
            return
        }
        else if gender.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Gender Field")
            
            return
        }
        else if dbText.isEmpty
        {
            self.showErrorMSg(text: "Please select Date of Birth")
            
            return
        }
        else if birthCity.isEmpty
        {
            self.showErrorMSg(text: "Please enter Birth-City")
            
            return
        }
        else if birthCountry.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Birth-Country Field")
            
            return
        }
        else if CurrentCountry.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current Country Field")
            
            return
        }
        else if CurrentState.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current State Field")
            
            return
        }
        else if CurrentCity.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current City Field")
            
            return
        }
        else if CurrentAddress.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Current Address Field")
            
            return
        }
        else if postcode.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Post code Field")
            
            return
        }
        else if emailText.isEmpty
        {
            self.showErrorMSg(text: "Please enter in Email Field")
            
            return
        }
        else if !emailText.EmailValidation()
        {
            self.showErrorMSg(text: "Please enter Correct Email ID")
            
            return
        }
        else if !isSelect{
            self.showErrorMSg(text: "Please read and accept Terms of Use and Privacy Policy")
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "IntroAppController") as! IntroAppController
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    func addPicker(){
       
            let alert = UIAlertController(style: .alert, title: "Select Date of Birth")
        
            let date = Calendar.current.date(byAdding: .year, value: -14, to: Date())
            dateText = date ?? Date()
            alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: date) { date in
                // action with selected date
                print(date)
                self.dateText = date
                //self.From_date = date
                
            }
            alert.addAction( title: "OK", style: .default, isEnabled: true) { (action) in
                self.txtDateBirth.text = convertTommDDyyyy(date:self.dateText)
        
            }
            alert.addAction(title: "Cancel", style: .cancel){ (action) in
    
            }
            
            alert.show()
        
    }
    
    func showErrorMSg(text : String)
    {
         AlertView.oneButtonAction(title: "Oops!", text, self)
    }
    
    
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 47.0/255.0, green: 115.0/255.0, blue: 252.0/255.0, alpha: 1.0).cgColor
        
        let colorMiddle = UIColor(red: 68.0/255.0, green: 60.0/255.0, blue: 252.0/255.0, alpha: 1.0).cgColor
        
        let colorBottom = UIColor(red: 48.0/255.0, green: 47.0/255.0, blue: 234.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorMiddle,colorBottom]
        gradientLayer.locations = [0.0,0.5, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
   
    //MARK: - textField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count == 0 {
            if string == " " {
                return false
            }
        }
      
        return true
    }
    
    //MARK: - touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
