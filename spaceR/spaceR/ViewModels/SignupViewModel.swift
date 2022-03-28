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
    private weak var delegate: ViewModelDelegate?
    
    private let coreDataPersistantObject = (UIApplication.shared.delegate
                                            as? AppDelegate)?.persistentContainer.viewContext
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.userFirstName = ""
        self.userLastName = ""
        self.userEmail = ""
        self.userPassword = ""
    }
    
    func validateUserInput(userFirstName: String?, userLastName: String?,
                           userEmail: String?, userPassword: String?) throws -> Bool {
        var validPassword: Bool = false
        if let safeFirstName = userFirstName, !safeFirstName.isEmpty,
           let safeLastName = userLastName, !safeLastName.isEmpty,
           let safeEmail = userEmail, !safeEmail.isEmpty,
           let safePassword = userPassword, !safePassword.isEmpty {
            self.userFirstName = safeFirstName
            self.userLastName = safeLastName
            self.userEmail = safeEmail
            self.userPassword = safePassword
            validPassword = true
        } else {
            validPassword = false
            throw CustomError.unsuccessfulSignupDueToMisingFields
        }
        return validPassword
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
