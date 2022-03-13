//
//  SignupViewController.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/28.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userFirstName: UITextField!
    @IBOutlet weak var userLastName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    private lazy var signUpViewModel = SignupViewModel()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        if validateUserInputFromSignupFields() {
            successFulSignup()
        } else {
            unsuccessfullSignup()
        }
    }
        
    func validateUserInputFromSignupFields() -> Bool {
        if let safeFirstName = self.userFirstName.text, !safeFirstName.isEmpty,
           let safeLastName = self.userLastName.text, !safeLastName.isEmpty,
           let safeEmail = self.userEmail.text, !safeEmail.isEmpty,
           let safePassword = self.userPassword.text,
           !safePassword.isEmpty {
            setSignupModelAttributes(firstName: safeFirstName, lastName: safeLastName, email: safeEmail, password: safePassword)
            return true
        } else {
            self.displayErrorAlertForUnsuccessfulSignup(title: "Signup Unsuccessful", errorMessage: "One or more of the fields are blank", buttonTitle: "Ok")
            return false
        }
    }
    
    func setSignupModelAttributes(firstName: String, lastName: String, email: String, password: String) {
        signUpViewModel.setUserFirstName(firstNameFromForm: firstName)
        signUpViewModel.setUserLastName(lastNameFromForm: lastName)
        signUpViewModel.setUserEmail(emailFromForm: email)
        signUpViewModel.setUserPassword(passwordFromForm: password)
    }
        
    func successFulSignup() {
        signUpViewModel.saveUserToDatabase()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
            as? UITabBarController {
            self.navigationController?.pushViewController(viewController, animated: false )
        }
    }
        
    func unsuccessfullSignup() {
        self.displayErrorAlertForUnsuccessfulSignup(title: "Signup Unsuccessful", errorMessage: "Did not ave to database", buttonTitle: "Ok")
    }
}
