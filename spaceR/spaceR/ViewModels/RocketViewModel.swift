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
    
    func getAllRockets() -> [Rocket] {
        return allRockets
    }
    
    func getRocketCount() -> Int {
        return allRockets.count
    }
    
    func getRocketImage(index: Int) -> String {
        return (allRockets[index].images.randomElement() ?? "") ?? allRockets[index].images[0]!
    }
    
    func getRocketTitle(index: Int) -> String {
        return allRockets[index].name ?? ""
    }
}
