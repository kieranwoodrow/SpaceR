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
    // swiftlint:disable force_cast
    private let coreDataPersistantObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // swiftlint:enable force_cast
    
    func validateUserCredentials(userEmail: String, userPassword: String) -> Bool {
        if validateUserEmailInLoginProcess(userEmail: userEmail) &&
            validateUserPasswordInLoginProcess(userPassword: userPassword) {
            return true
        } else {
            return false
        }
    }
    
    func validateUserEmailInLoginProcess(userEmail: String) -> Bool {
        var validEmail: Bool = false
        do {
            try user = coreDataPersistantObject.fetch(User.fetchRequest())
            if !user.isEmpty {
                for users in user {
                    // swiftlint:disable force_cast
                    if users.value(forKey: "email") as! String == userEmail {
                        validEmail = true
                    }
                    // swiftlint:enable force_cast
                }
            }
        } catch {
            validEmail = false
        }
        return validEmail
    }
    
    func validateUserPasswordInLoginProcess(userPassword: String) -> Bool {
        var validPassword: Bool = false
        do {
            try user = coreDataPersistantObject.fetch(User.fetchRequest())
            if !user.isEmpty {
                for users in user {
                    // swiftlint:disable force_cast
                    if users.value(forKey: "password") as! String == userPassword {
                        validPassword = true
                    }
                    // swiftlint:enable force_cast
                }
            }
        } catch {
            validPassword = false
        }
        return validPassword
    }
}
