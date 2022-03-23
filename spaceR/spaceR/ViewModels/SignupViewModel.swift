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
    
    func set(firstName: String) {
        userFirstName = firstName
    }
    
    func set(lastName: String) {
        userLastName = lastName
    }
    
    func set(email: String) {
        userEmail = email
    }
    
    func set(password: String) {
        userPassword = password
    }
    
    func saveUserToDatabase() throws {
        guard let safeCoreData = self.coreDataPersistantObject else { return }
        let newUser = User(context: safeCoreData)
        newUser.firstName = userFirstName
        newUser.lastName = userLastName
        newUser.email = userEmail
        newUser.password = userPassword
        
        do {
            try self.coreDataPersistantObject?.save()
        } catch {
            throw CustomError.unsuccessfulDatabaseSignup
        }
    }
    
}
