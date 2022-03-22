//
//  UILaunchpadTableViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/22.
//

import Foundation
import UIKit

class UILaunchpadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var launchpadTableViewTitle: UILabel!
    @IBOutlet weak var launchpadTableViewImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    func setLaunchpadTableViewTitle(launchpadTitle: String) {
        launchpadTableViewTitle.text = launchpadTitle
    }
    
    func setLaunchpadTableViewImage(launchpadImage: String) {
        if let safeLaunchpadImageURl = URL(string: launchpadImage) {
            launchpadTableViewImage.getImagesFromURL(imageURL: safeLaunchpadImageURl)
        }
    }
    
    func launchpadImageStyling() {
        launchpadTableViewImage.imageStyle(type: "launchpadTable")
    }
    
    func setLaunchpadCell(launchpadImage: String, launchpadTitle: String, atIndex: Int) {
        setLaunchpadTableViewImage(launchpadImage: launchpadImage)
        setLaunchpadTableViewTitle(launchpadTitle: launchpadTitle)
        launchpadImageStyling()
    }
}
