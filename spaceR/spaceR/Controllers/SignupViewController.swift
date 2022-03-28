//
//  SignupViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/28.
//

import UIKit

class SignupViewController: UIViewController {
 
    @IBOutlet private weak var userFirstName: UITextField!
    @IBOutlet private weak var userLastName: UITextField!
    @IBOutlet private weak var userEmail: UITextField!
    @IBOutlet private weak var userPassword: UITextField!
    private lazy var signUpViewModel = SignupViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction private func signupButtonClicked(_ sender: Any) {
        do {
            try
                signUpViewModel.validateUserInput(userFirstName: userFirstName.text,
                                          userLastName: userLastName.text,
                                          userEmail: userEmail.text,
                                          userPassword: userPassword.text) ? self.successfulSignup() : self.unsuccessfullSignup()
        } catch {
            self.displayErrorAlert(title: .unsuccessfulSignupDueToMisingFields,
                                   errorMessage: .unsuccessfulSignupDueToMisingFields,
                                   buttonTitle: "Ok")
        }
    }
    
    private func successfulSignup() {
        do {
            try self.signUpViewModel.saveUserToDatabase()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
                as? LoginViewController {
                self.navigationController?.pushViewController(viewController, animated: false )
            }
        } catch {
            self.displayErrorAlert(title: .unsuccessfulDatabaseSignup,
                                   errorMessage: .unsuccessfulDatabaseSignup,
                                   buttonTitle: "Ok")
        }
    }
    
    private func unsuccessfullSignup() {
        self.displayErrorAlert(title: .unsuccessfulDatabaseSignup,
                               errorMessage: .unsuccessfulDatabaseSignup,
                               buttonTitle: "Ok")
    }
}

extension SignupViewController: ViewModelDelegate {
    
    func reloadView() {
        return
    }
    
    func show(error: String) {
        self.displayErrorAlert(title: .unsuccessfulRocketApiCall,
                               errorMessage: .unsuccessfulRocketApiCall,
                               buttonTitle: "OK")
    }
    
}
