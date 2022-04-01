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
    private lazy var signUpViewModel = SignupViewModel(repository: SignupRepository(),
                                                       delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction private func signupButtonClicked(_ sender: Any) {
        signUpViewModel.handleSaveRequest(firstName: userFirstName?.text ?? "",
                                          lastName: userLastName?.text ?? "",
                                          email: userEmail?.text ?? "", password: userPassword?.text ?? "")
    }
}

extension SignupViewController: ViewModelDelegate {
    
    func reloadView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
            as? LoginViewController {
            self.navigationController?.pushViewController(viewController, animated: false )
        }
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
