//
//  LoginViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private var userEmail: String?
    private var userPassword: String?
    private var user: [User]
    private weak var delegate: ViewModelDelegate?
    private let coreDataPersistantObject = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.userEmail = ""
        self.userPassword = ""
        self.user = []
    }
    
    func validateUserCredentials(userEmail: String?, userPassword: String?) throws -> Bool {
        do {
            return try validateUserEmail(userEmail: userEmail) && validateUserPassword(userPassword: userPassword)
        } catch {
            throw error
        }
    }
    
    func validateUserEmail(userEmail: String?) throws -> Bool {
        var validEmail: Bool = false
        if let safeUserEmail = userEmail,
           !safeUserEmail.isEmpty {
            self.userEmail = safeUserEmail
        }
        do {
            try user = coreDataPersistantObject?.fetch(User.fetchRequest()) ?? []
            if !user.isEmpty {
                for users in user {
                    if users.value(forKey: "email") as? String == self.userEmail {
                        validEmail = true
                    }
                }
            }
        } catch {
            validEmail = false
            throw CustomError.unsuccessfulLoginDueToMissingFields
        }
        return validEmail
    }
    
    func validateUserPassword(userPassword: String?) throws -> Bool {
        var validPassword: Bool = false
        if let safeUserPassword = userPassword,
           !safeUserPassword.isEmpty {
            self.userPassword = safeUserPassword
        }
        do {
            try user = coreDataPersistantObject?.fetch(User.fetchRequest()) ?? []
            if !user.isEmpty {
                for users in user {
                    
                    if users.value(forKey: "password") as? String == userPassword {
                        validPassword = true
                    }
                }
            }
        } catch {
            validPassword = false
            throw CustomError.unsuccessfulLoginDueToMissingFields
        }
        return validPassword
    }
}
