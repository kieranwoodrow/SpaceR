//
//  LoginViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private var user: [User] = []
    private let coreDataPersistantObject = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func validateUserCredentials(userEmail: String, userPassword: String) -> Bool {
        return validateUserEmail(userEmail: userEmail) && validateUserPassword(userPassword: userPassword)
    }
    
    func validateUserEmail(userEmail: String) -> Bool {
        var validEmail: Bool = false
        do {
            try user = coreDataPersistantObject?.fetch(User.fetchRequest()) ?? []
            if !user.isEmpty {
                for users in user {
                    if users.value(forKey: "email") as? String == userEmail {
                        validEmail = true
                    }
                }
            }
        } catch {
            validEmail = false
        }
        return validEmail
    }
    
    func validateUserPassword(userPassword: String) -> Bool {
        var validPassword: Bool = false
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
        }
        return validPassword
    }
}
