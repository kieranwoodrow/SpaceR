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
    
//    func style(){
//        rocketImage.layer.cornerRadius = 13.0
//        rocketImage.clipsToBounds = true
//        rocketImage.layer.shadowColor = UIColor.darkGray.cgColor
//        rocketImage.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
//        rocketImage.layer.shadowRadius = 13.0
//        rocketImage.layer.shadowOpacity = 0.9
//    }
//
    
}
