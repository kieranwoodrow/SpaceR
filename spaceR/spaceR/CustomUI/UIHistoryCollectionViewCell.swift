//
//  UIHistoryCollectionViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation
import UIKit

class UIHistoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var historicEventTitle: UILabel!
    @IBOutlet private weak var historicEventDate: UILabel!
    @IBOutlet private weak var historicEventDescription: UILabel!
    
    func set(historicEventTitle: String) {
        self.historicEventTitle.text = historicEventTitle
    }
    
    func set(historicEventDate: String) {
        self.historicEventDate.text = historicEventDate
    }
    
    func set(historicEventDescription: String) {
        self.historicEventDescription.text = historicEventDescription
    }
    
    func setRocketCell(title: String, date: String, description: String ) {
        set(historicEventTitle: title)
        set(historicEventDate: date)
        set(historicEventDescription: description)
    }
}
