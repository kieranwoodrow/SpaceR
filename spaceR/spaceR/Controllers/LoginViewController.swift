//
//  LoginViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/28.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var textFieldEmailID: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    private lazy var loginViewModel = LoginViewModel(repository: LoginRepository(),
                                                     delegate: self)
    
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
        loginViewModel.validateUserCredentials(userEmail: textFieldEmailID.text,
                                               userPassword: textFieldPassword.text)
    }
}

extension LoginViewController: ViewModelDelegate {
    
    func reloadView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController")
            as? UITabBarController {
            self.navigationController?.pushViewController(viewController, animated: false )
        }
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
