//
//  UIRocketTableViewCell.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/09.
//

import Foundation

import UIKit

class UIRocketTableViewCell: UITableViewCell {
    
    
   
    @IBOutlet weak var rocketTableViewImage: UIImageView!
    @IBOutlet weak var rocketTableViewTitle: UILabel!
    //    func setRocketImage(image: String) {
//        guard let image = UIImage(named: image)else {
//            image = ""
//        }
//        rocketImage.image = image
//        rocketImage.sizeToFit()
//
//    }
//
    func setRocketTableViewTitle(rocketTitle: String) {
        rocketTableViewTitle.text = rocketTitle
        print("Title has been set to " + self.rocketTableViewTitle.text!   )
    }
    
    func setRocketTableViewImage(rocketImageAsString: String) {
        
        if let safeRocketImageURl = URL(string: rocketImageAsString){
            rocketTableViewImage.getImagesFromURL(imageURL: safeRocketImageURl )
            
        }
        
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
