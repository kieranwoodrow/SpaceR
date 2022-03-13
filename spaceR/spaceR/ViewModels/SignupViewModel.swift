//
//  SignupViewModel.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//

import Foundation
import UIKit

class SignupViewModel {
    
    private var firstName = ""
    private var lastName = ""
    private var email = ""
    private var password = ""
    let coreDataPersistantObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func setUserFirstName(firstNameFromForm: String) {
        firstName = firstNameFromForm
    }
    
    func setUserLastName(lastNameFromForm: String) {
        lastName = lastNameFromForm
    }
    
    func setUserEmail(emailFromForm: String) {
        email = emailFromForm
    }
    
    func setUserPassword(passwordFromForm: String) {
        password = passwordFromForm
    }
    
    func saveUserToDatabase() {
        let newUser = User(context: self.coreDataPersistantObject)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = password
        do {
            try self.coreDataPersistantObject.save()
        } catch {
            //something here
        }
    }
}
