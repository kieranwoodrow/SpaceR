//
//  RocketViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/08.
//

import Foundation

class RocketViewModel {
    
    private var allRockets: [Rocket]
    
    init() {
        self.allRockets = []
    }
    
    func setAllRockets(rockets: [Rocket]) {
        allRockets = rockets
    }
    
    var rocketList: [Rocket] { return allRockets }
    
    var rocketCount: Int { return allRockets.count }
    
    func getRocketImage(atIndex: Int) -> String {
        var rocketImage = ""
        if let safeImage = allRockets[atIndex].images.randomElement() {
            rocketImage = safeImage ?? ""
        }
        return rocketImage
    }
    
    func getRocketTitle(atIndex: Int) -> String {
        return allRockets[atIndex].name ?? ""
    }
    
    func getRocket(atIndex: Int) -> Rocket {
        return allRockets[atIndex]
    }
}
