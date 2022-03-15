//
//  UIErrorAlerts.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation

import UIKit

extension UIViewController {
    
    enum CustomError: Error, LocalizedError {
        case invalidLoginDueToMissingFieds
        case invalidLoginDueToInvalidAccountDetails
        case invalidSignupDueToMisingFields
        
        public var errorDescription: String? {
            switch self {
            case .invalidLoginDueToMissingFieds:
                return NSLocalizedString(
                    "The provided password is not valid.",
                    comment: "Invalid Password"
                )
            case .invalidLoginDueToInvalidAccountDetails:
                return NSLocalizedString(
                    "The specified item could not be found.",
                    comment: "Resource Not Found"
                )
            case .invalidSignupDueToMisingFields:
                return NSLocalizedString(
                    "An unexpected error occurred.",
                    comment: "Unexpected Error"
                )
            }
        }
    }
    
    func displayErrorAlertForUnsuccessfulLogin(title: String, errorMessage: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorAlertForUnsuccessfulSignup(title: String, errorMessage: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
