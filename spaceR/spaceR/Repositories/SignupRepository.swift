//
//  SignupRepository.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/29.
//

import Foundation
import UIKit

typealias SignupResult = (Result<Bool, CustomError>) -> Void

protocol SignupRepositoryType: AnyObject {
    
    func saveUser(firstName: String,
                  lastName: String,
                  email: String, password: String,
                  completion: @escaping(SignupResult))
}

class SignupRepository: SignupRepositoryType {
    
    private var user: [User]
    private var successFulSignup: Bool
    private let coreDataPersistantObject = (UIApplication.shared.delegate as?           AppDelegate)?.persistentContainer.viewContext
    
    init() {
        self.user = []
        self.successFulSignup = false
    }
    
    func saveUser(firstName: String, lastName: String,
                  email: String, password: String, completion: @escaping(SignupResult)) {
        
        guard let safeCoreData = self.coreDataPersistantObject else { return }
        let newUser = User(context: safeCoreData)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = password
        do {
            try self.coreDataPersistantObject?.save()
            self.successFulSignup = true
            completion(Result.success(successFulSignup))
        } catch {
            completion(Result.failure(.unsuccessfulDatabaseSignup))
        }
    }
}
