//
//  LoginViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private var validPassword: Bool
    private var validEmail: Bool
    private var userEmail: String?
    private var userPassword: String?
    private weak var delegate: ViewModelDelegate?
    private var repository: LoginRepositoryType?
    
    init(repository: LoginRepositoryType,
         delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.repository = repository
        self.userEmail = ""
        self.userPassword = ""
        self.validEmail = false
        self.validPassword = false
    }
    
    func validateUserCredentials(userEmail: String, userPassword: String) {
        if !userEmail.isEmpty && !userPassword.isEmpty {
            validateEmail(userEmail: userEmail) && validatePassword(userPassword: userPassword)
            ? delegate?.reloadView() : delegate?.show(error: .unsuccessfulLoginDueToInvalidAccountDetails)
        } else {
            delegate?.show(error: .unsuccessfulLoginDueToMissingFields)
        }
    }
    
    func validateEmail(userEmail: String) -> Bool {
        self.userEmail = userEmail
        repository?.fetchEmail(email: userEmail, completion: { [weak self] result in
            switch result {
            case .success(let email):
                if self?.userEmail == email {
                    self?.validEmail = true
                }
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
        return validEmail
    }
    
    func validatePassword(userPassword: String) -> Bool {
        self.userPassword = userPassword
        repository?.fetchPassword(password: userPassword, completion: { [weak self] result in
            switch result {
            case .success(let password):
                if self?.userPassword == password {
                    self?.validPassword = true
                }
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
        return validPassword
    }
}
