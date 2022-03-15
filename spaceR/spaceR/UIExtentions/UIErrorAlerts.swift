//
//  UIErrorAlerts.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation

import UIKit

class UIErrorAlerts {
    
    enum CustomError: Error, LocalizedError {
        case unsuccessfulLoginDueToMissingFields
        case unsuccessfulLoginDueToInvalidAccountDetails
        case unsuccessfulSignupDueToMisingFields
        case unsuccessfulDatabaseSignup
        case unsuccessfulRocketApiCall
        
        var errorDescription: String? {
            switch self {
            case .unsuccessfulLoginDueToMissingFields:
                return "Login Unsuccessful"
            case .unsuccessfulLoginDueToInvalidAccountDetails:
                return "Login Unsuccessful"
            case .unsuccessfulSignupDueToMisingFields:
                return "Signup Unsuccessful"
            case .unsuccessfulDatabaseSignup:
                return "Database save unsuccessful"
            case .unsuccessfulRocketApiCall:
                return "Api call unsuccessful"
            }
            
        }
        
        var failureReason: String? {
            switch self {
            case .unsuccessfulLoginDueToMissingFields:
                return "One or more of the fields are blank"
            case .unsuccessfulLoginDueToInvalidAccountDetails:
                return "Account details are incorrect or you do not have an account with us."
            case .unsuccessfulSignupDueToMisingFields:
                return "One or more of the fields are blank"
            case .unsuccessfulDatabaseSignup:
                return "User info did not get saved to database"
            case .unsuccessfulRocketApiCall:
                return "Rockets information has not been loaded successfully"
            }
        }
    }
}

extension UIViewController {
    
    func displayErrorAlert(title: String, errorMessage: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
