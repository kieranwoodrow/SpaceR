//
//  UIErrorAlerts.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation

import UIKit

extension UIViewController {
    
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
