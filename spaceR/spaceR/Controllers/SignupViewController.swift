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
    private lazy var signUpViewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction private func signupButtonClicked(_ sender: Any) {
        self.validateUserInputFromSignupFields() ? self.successfulSignup() : self.unsuccessfullSignup()
    }
    
    private func validateUserInputFromSignupFields() -> Bool {
        if let safeFirstName = self.userFirstName.text, !safeFirstName.isEmpty,
           let safeLastName = self.userLastName.text, !safeLastName.isEmpty,
           let safeEmail = self.userEmail.text, !safeEmail.isEmpty,
           let safePassword = self.userPassword.text,
           !safePassword.isEmpty {
            setSignupModelAttributes(firstName: safeFirstName, lastName: safeLastName, email: safeEmail, password: safePassword)
            return true
        } else {
            self.displayErrorAlert(title: .unsuccessfulSignupDueToMisingFields, errorMessage: .unsuccessfulSignupDueToMisingFields, buttonTitle: "Ok")
        }
        return false
    }
    
    private func setSignupModelAttributes(firstName: String, lastName: String, email: String, password: String) {
        signUpViewModel.set(firstName: firstName)
        signUpViewModel.set(lastName: lastName)
        signUpViewModel.set(email: email)
        signUpViewModel.set(password: password)
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
            self.displayErrorAlert(title: .unsuccessfulDatabaseSignup, errorMessage: .unsuccessfulDatabaseSignup, buttonTitle: "Ok")
        }
    }
    
    private func unsuccessfullSignup() {
        self.displayErrorAlert(title: .unsuccessfulDatabaseSignup, errorMessage: .unsuccessfulDatabaseSignup, buttonTitle: "Ok")
    }
}
