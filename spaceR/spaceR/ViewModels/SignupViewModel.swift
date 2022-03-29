//
//  SignupViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class SignupViewModel {
    
    private var userFirstName: String
    private var userLastName: String
    private var userEmail: String
    private var userPassword: String
    private var validCredentials: Bool
    private var saveStatus: Bool
    private weak var delegate: ViewModelDelegate?
    private weak var repository: SignupRepositoryType?
    
    private let coreDataPersistantObject = (UIApplication.shared.delegate
                                            as? AppDelegate)?.persistentContainer.viewContext
    
    init(repository: SignupRepositoryType,
         delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.repository = repository
        self.userFirstName = ""
        self.userLastName = ""
        self.userEmail = ""
        self.userPassword = ""
        self.validCredentials = false
        self.saveStatus = false
    }
    
    func handleSaveRequest(firstName: String, lastName: String, email: String, password: String) {
        if validateUserInput(userFirstName: firstName, userLastName: lastName, userEmail: email, userPassword: password) {
            saveUserToDatabase() ? delegate?.reloadView() : delegate?.show(error: .unsuccessfulDatabaseSignup)
        } else {
            delegate?.show(error: .unsuccessfulSignupDueToMisingFields)
        }
    }
    
    func validateUserInput(userFirstName: String, userLastName: String,
                           userEmail: String, userPassword: String) -> Bool {
        if !userFirstName.isEmpty, !userLastName.isEmpty, !userEmail.isEmpty,!userPassword.isEmpty {
            self.userFirstName = userFirstName
            self.userLastName = userLastName
            self.userEmail = userEmail
            self.userPassword = userPassword
            validCredentials = true
        }
        return validCredentials
    }
    
    func saveUserToDatabase() -> Bool {
        repository?.saveUser(firstName: userFirstName, lastName: userLastName,
                             email: userEmail, password: userPassword,
                             completion: { [weak self] result in
            switch result {
            case .success(let savedSuccessfully):
                self?.saveStatus = savedSuccessfully
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
        return saveStatus
    }
}
