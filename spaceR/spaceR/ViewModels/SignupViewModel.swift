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
    
    private let coreDataPersistantObject = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func setUserFirstName(name: String) {
        userFirstName = name
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
        let newUser = User(context: self.coreDataPersistantObject ?? <#default value#>   )
        newUser.firstName = userFirstName
        newUser.lastName = userLastName
        newUser.email = userEmail
        newUser.password = userPassword
        
        do {
            try self.coreDataPersistantObject?.save()
        } catch {
            
        }
    }
    
}
