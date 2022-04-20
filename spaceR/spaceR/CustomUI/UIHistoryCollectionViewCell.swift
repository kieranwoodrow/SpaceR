//
//  UIHistoryCollectionViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation
import UIKit

class UIHistoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var historicEventHeadline: UILabel!
    @IBOutlet weak var historicEventDate: UILabel!
    @IBOutlet weak var historicEventInfo: UILabel!
    
    func set(historicEventHeadline: String) {
        self.historicEventHeadline.text = historicEventHeadline
    }
    
    func set(historicEventDate: String) {
        self.historicEventDate.text = historicEventDate
    }
    
    func set(historicEventInfo: String) {
        self.historicEventInfo.text = historicEventInfo
    }
    
    func setHistoryCell(title: String, date: String, description: String ) {
        set(historicEventHeadline: title)
        set(historicEventDate: date)
        set(historicEventInfo: description)
        self.layer.borderColor = UIColor(named: "BorderCell")?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
}
