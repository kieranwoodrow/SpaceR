//
//  UIRocketInfoCollectionViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/01.
//

import Foundation
import UIKit

class UIRocketInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var rocketCollectionViewTitle: UILabel!
    @IBOutlet private weak var rocketCollectionViewInfo: UILabel!
    
    func set(rocketTitle: String) {
        self.rocketCollectionViewTitle.text = rocketTitle
    }
    
    func set(rocketInfo: String) {
        self.rocketCollectionViewInfo.text = rocketInfo
    }
    
    func setRocketCell(headings: [String: String]) {
        set(rocketTitle: headings["heading"] ?? "")
        set(rocketInfo: headings["info"] ?? "")
        self.layer.borderColor = UIColor(named: "BorderCell")?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
}
