//
//  ImageApiFunction.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/09.
//

import Foundation
import UIKit

extension UIImageView {
    
    func getImagesFromURL(imageURL: URL) {
        DispatchQueue.global().async { [weak self] in
            if let safeImage = try? Data(contentsOf: imageURL) {
                if let safeUIImage = UIImage(data: safeImage) {
                    DispatchQueue.main.async {
                        self?.image = safeUIImage
                    }
                }
            }
        }
    }
}
