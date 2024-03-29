//
//  UIRocketTableViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/09.
//

import Foundation
import UIKit

class UIRocketTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var rocketTableViewTitle: UILabel!
    @IBOutlet private weak var rocketTableViewImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20,
                                                                     left: 20,
                                                                     bottom: 20,
                                                                     right: 20))
    }
    
    func setRocketTableViewTitle(rocketTitle: String) {
        rocketTableViewTitle.text = rocketTitle
    }
    
    func setRocketTableViewImage(rocketImage: String) {
        if let safeRocketImageURl = URL(string: rocketImage) {
            rocketTableViewImage.getImagesFromURL(imageURL: safeRocketImageURl)
        }
    }
    
    func rocketImageStyling() {
        rocketTableViewImage.imageStyle(type: .rocketTable)
    }
    
    func setRocketCell(rocketImage: String, rocketTitle: String, atIndex: Int) {
        setRocketTableViewTitle(rocketTitle: rocketTitle)
        setRocketTableViewImage(rocketImage: rocketImage)
        rocketImageStyling()
    }
}
