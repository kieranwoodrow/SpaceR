//
//  UITableViewImageStyling.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/11.
//

import Foundation
import UIKit

enum TableType {
    case rocketTable
    case launchpadTable
}

extension UIImageView {
    
    func imageStyle(type: TableType) {
        switch (type) {
        case .launchpadTable:
            self.layer.cornerRadius = 20
        case .rocketTable:
            self.layer.cornerRadius = 30
        }
    }
}
