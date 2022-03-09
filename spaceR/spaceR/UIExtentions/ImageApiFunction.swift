//
//  ImageApiFunction.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/09.
//

import Foundation
import UIKit

extension UIImageView {
    
    func convertImageFromStringToURL(imageString: URL) {
        DispatchQueue.global().async { [weak self] in
            if let safeImage = try? Data(contentsOf: imageString) {
                if let SafeUiImage = UIImage(data: safeImage) {
                    DispatchQueue.main.async {
                        self?.image = SafeUiImage
                    }
                }
            }
        }
    }
}
