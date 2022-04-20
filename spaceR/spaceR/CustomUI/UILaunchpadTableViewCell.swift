//
//  UILaunchpadTableViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/22.
//

import Foundation
import UIKit

class UILaunchpadTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var launchpadTableViewTitle: UILabel!
    @IBOutlet private weak var launchpadTableViewImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20,
                                                                     bottom: 20, right: 20))
    }
    
    func set(launchpadTitle: String) {
        launchpadTableViewTitle.text = launchpadTitle
    }
    
    func set(launchpadImage: String) {
        if let safeLaunchpadImageURl = URL(string: launchpadImage) {
            launchpadTableViewImage.getImagesFromURL(imageURL: safeLaunchpadImageURl)
        }
    }
    
    func setLaunchpadCell(image: String, title: String) {
        set(launchpadImage: image)
        set(launchpadTitle: title)
    }
}
