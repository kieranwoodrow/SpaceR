//
//  SignupViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class SignupViewModel {
    
    private var userFirstName = ""
    private var userLastName = ""
    private var userEmail = ""
    private var userPassword = ""
    // swiftlint:disable force_cast
    private let coreDataPersistantObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // swiftlint:enable force_cast
    
    func setUserFirstName(firstNameFromForm: String) {
        userFirstName = firstNameFromForm
    }
    
    func setUserLastName(lastNameFromForm: String) {
        userLastName = lastNameFromForm
    }
    
    func setUserEmail(emailFromForm: String) {
        userEmail = emailFromForm
    }
    
    func setUserPassword(passwordFromForm: String) {
        userPassword = passwordFromForm
    }
    
    func saveUserToDatabase() {
        let newUser = User(context: self.coreDataPersistantObject)
        newUser.firstName = userFirstName
        newUser.lastName = userLastName
        newUser.email = userEmail
        newUser.password = userPassword
        
        do {
            try self.coreDataPersistantObject.save()
        } catch {
            
        }
    }
    
}
