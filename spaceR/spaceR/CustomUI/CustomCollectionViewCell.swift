//
//  CustomCollectionViewCell.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/08.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var rocketTitle: UILabel!
    
//    func setRocketImage(image: String) {
//        guard let image = UIImage(named: image)else {
//            image = ""
//        }
//        rocketImage.image = image
//        rocketImage.sizeToFit()
//
//    }
//
    func setRocketTitle(title: String) {
        rocketTitle.text = title
    }
    
    func test(){
//        rocketImage.layer.cornerRadius = 13.0
//        rocketImage.clipsToBounds = true
//        rocketImage.layer.shadowColor = UIColor.darkGray.cgColor
//        rocketImage.layer.shadowOffset = CGSize(width: 370.0, height: 370.0)
//        rocketImage.layer.shadowRadius = 13.0
//        rocketImage.layer.shadowOpacity = 0.9
    }
    

    
}



