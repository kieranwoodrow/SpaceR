//
//  CustomCollectionViewCell.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/08.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var rocketTitle: UILabel!
    
    func setRocketImage(image: String) {
        let image = UIImage(named: image)
        rocketImage.image = image
        rocketImage.sizeToFit()
    }
    
    func setRocketTitle(title: String) {
        rocketTitle.text = title
    }
    

    
}
