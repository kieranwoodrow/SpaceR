//
//  UIErrorAlerts.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation

import UIKit

enum CustomError: Error, LocalizedError {
    case unsuccessfulLoginDueToMissingFields
    case unsuccessfulLoginDueToInvalidAccountDetails
    case unsuccessfulSignupDueToMisingFields
    case unsuccessfulDatabaseSignup
    case unsuccessfulRocketApiCall
    case unsuccessfulLaunchpadApiCall
    case invalidUrl
    case invalidData
    case internalError
    case parsingError
    
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
            return "Api call for rockets unsuccessful"
        case .unsuccessfulLaunchpadApiCall:
            return "Api call for launchpads unsuccessful"
        case .invalidUrl:
            return "Invalid URL"
        case .invalidData:
            return "Invalid data"
        case .internalError:
            return "Internal error"
        case .parsingError:
            return "Passing error"
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
        case .unsuccessfulLaunchpadApiCall:
            return "Launchpad information has not been loaded successfully"
        case .invalidUrl:
            return "The URL is invalid"
        case .invalidData:
            return "The data is invalid"
        case .internalError:
            return "There was an internal error"
        case .parsingError:
            return "There was a parsing error"
        }
    }
}

extension UIViewController {
    
    func displayErrorAlert(title: CustomError, errorMessage: CustomError, buttonTitle: String) {
        let alert = UIAlertController(title: title.errorDescription,
                                      message: errorMessage.failureReason,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
