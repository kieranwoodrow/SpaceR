//
//  RocketInfoViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/23.
//

import Foundation

class RocketInfoViewModel {
    
    private var rocket: Rocket?
    
     func set(rocket: Rocket) {
        self.rocket = rocket
    }
    
    var rocketDescription: String {
        return rocket?.description ?? ""
    }
    
    var rocketName: String {
        return rocket?.name ?? ""
    }

}
