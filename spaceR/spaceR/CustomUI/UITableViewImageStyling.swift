//
//  UITableViewImageStyling.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageStyle(type: String) {
        switch (type) {
            
        case type where type == "launchpadTable":
            self.layer.cornerRadius = 20
            
        case type where type == "rocketTable":
            self.layer.cornerRadius = 30
            
        default:
            self.layer.cornerRadius = 0
        }
    }
}
