//
//  LoginVC.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/11/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var emailTF:UITextField!
    @IBOutlet weak var passwordTF:UITextField!
    @IBOutlet weak var showPasswordBtn:UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func setupUI() {
        
        viewModel.push.asObservable().subscribe(onNext: { [weak self] isPush in
            guard let self = self else {return}
            if isPush {
                DispatchQueue.main.async {
                    let vc = UIStoryboard.main.loginVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }).disposed(by: disposeBag)
        
    }
    
    
    func isValid(email:String,password:String) -> Bool {
        if email.isBlank  || password.isBlank  {
            self.showAlert(withMessage: "Please fill all fields")
            return false
        }
        if !email.isValidateEmail(email: email) {
            self.showAlert(withMessage: "Email isn't valid email")
            return false
        }
        if !password.isValidPassword(pass: password) {
            self.showAlert(withMessage: "Password isn't valid password or less than 8 characters")
            return false
        }
        return true
    }
    
    
    @IBAction func didTapSkip(){
        self.viewModel.login()
    }
    
    @IBAction func showPassword(_ sender:UIButton) {
        if self.passwordTF.isSecureTextEntry {
            self.passwordTF.isSecureTextEntry = false
            sender.setImage(#imageLiteral(resourceName: "visibility"), for: .normal)
        }else{
            self.passwordTF.isSecureTextEntry = true
            sender.setImage(#imageLiteral(resourceName: "visibility_off"), for: .normal)
        }
    }
    
    @IBAction func didTapLogin() {
        guard let email = emailTF.text , let password = passwordTF.text else {return}
        if isValid(email: email, password: password) {
            self.viewModel.login()
        }
    }
}
