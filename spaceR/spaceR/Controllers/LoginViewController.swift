//
//  LoginViewController.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/28.
//


 
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldEmailID: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
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
    
    @IBAction func loginSuccess(_ sender: Any) {
        
        if let email = self.textFieldEmailID.text, !email.isEmpty,  email == "Admin",
           let password = self.textFieldPassword.text, !password.isEmpty, password == ("TestPass123") {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyBoard.instantiateViewController(withIdentifier: "RocketsController")
                as? RocketsController {
                viewController.emailText = "Welcome \(email)"
                self.navigationController?.pushViewController(viewController, animated: false )
            }
        }
        else {
            self.displayAlert(title: "Email and password",
                              message: "Email or passsword is incorrect)",
                              buttonTitle: "Ok")
            return
        }
    }
}
