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
            self.displayErrorAlert(title: CustomError.unsuccessfulSignupDueToMisingFields.errorDescription!, errorMessage: CustomError.unsuccessfulSignupDueToMisingFields.failureReason!, buttonTitle: "Ok")
        }
            return false
        }
    
    private func setSignupModelAttributes(firstName: String, lastName: String, email: String, password: String) {
        signUpViewModel.setUserFirstName(name: firstName)
        signUpViewModel.setUserLastName(lastNameFromForm: lastName)
        signUpViewModel.setUserEmail(emailFromForm: email)
        signUpViewModel.setUserPassword(passwordFromForm: password)
    }
    
    private func successfulSignup() {
        signUpViewModel.saveUserToDatabase()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
            as? LoginViewController {
            self.navigationController?.pushViewController(viewController, animated: false )
        }
    }
    
    private func unsuccessfullSignup() {
        self.displayErrorAlert(title: CustomError.unsuccessfulDatabaseSignup.errorDescription!, errorMessage: CustomError.unsuccessfulDatabaseSignup.failureReason!, buttonTitle: "Ok")
    }
}
