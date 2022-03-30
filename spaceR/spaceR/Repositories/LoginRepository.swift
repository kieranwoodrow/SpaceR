//
//  LoginRepository.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/29.
//

import Foundation
import UIKit

typealias Email = (Result<String, CustomError>) -> Void
typealias Password = (Result<String, CustomError>) -> Void

protocol LoginRepositoryType: AnyObject {
    
    func fetchEmail(email: String, completion: @escaping(Email))
    func fetchPassword(password: String, completion: @escaping(Password))
}

class LoginRepository: LoginRepositoryType {
    
    private var user: [User]
    private let coreDataPersistantObject = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    init() {
        self.user = []
    }
    
    func fetchEmail(email: String, completion: @escaping(Email)) {
        do {
            try user = coreDataPersistantObject?.fetch(User.fetchRequest()) ?? []
            if !user.isEmpty {
                for users in user {
                    completion(Result.success(users.value(forKey: "email") as? String ?? ""))
                }
            }
        } catch {
            completion(Result.failure(.unsuccessfulLoginDueToInvalidAccountDetails))
        }
    }
    
    func fetchPassword(password: String, completion: @escaping(Password)) {
        do {
            try user = coreDataPersistantObject?.fetch(User.fetchRequest()) ?? []
            if !user.isEmpty {
                for users in user {
                    let test = users.value(forKey: "password") as? String ?? ""
                    completion(Result.success(test))
                }
            }
        } catch {
            completion(Result.failure(.unsuccessfulLoginDueToInvalidAccountDetails))
        }
    }
}
