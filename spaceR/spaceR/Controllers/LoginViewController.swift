//
//  LoginViewController.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/28.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var textFieldEmailID: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    private lazy var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        textFieldEmailID.delegate = self
        textFieldPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldEmailID.resignFirstResponder()
        self.textFieldPassword.resignFirstResponder()
        return true
    }
    
    @IBAction private func loginButtonClicked(_ sender: Any) {
        if let safeEmail = self.textFieldEmailID.text, !safeEmail.isEmpty,
           let safePassword = self.textFieldPassword.text, !safePassword.isEmpty {
            if loginViewModel.validateUserCredentials(userEmail: safeEmail, userPassword: safePassword) {
                successfulLogin()
            } else {
                unsuccessfulLogin()
            }
        }
        self.displayErrorAlertForUnsuccessfulSignup(title: "Login Unsuccessful", errorMessage: "One or more of the fields are blank", buttonTitle: "Ok")
    }

    func successfulLogin() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController")
            as? UITabBarController {
            self.navigationController?.pushViewController(viewController, animated: false )
        }
    }
    
    func unsuccessfulLogin() {
        self.displayErrorAlertForUnsuccessfulLogin(title: "Email and password",
                                                   errorMessage: "Email or passsword is incorrect or you do not have an account with us.",
                                                   buttonTitle: "Ok")
    }
}
