//
//  RocketInfoViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/01.
//

import Foundation

class RocketInfoVieModel {
    
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
    
    var country: String {
        return rocket?.country ?? ""
    }
    
    var mass: Double {
        return rocket?.mass?.kg ?? 0.0
    }
    
    var status: Bool {
        return rocket?.active ?? false
    }
    
    var launchCost: Int {
        return rocket?.costPerLaunch ?? 0
    }
    
    var successRate: Int {
        return rocket?.successRatePercentage ?? 0
    }
    
    var firstFlight: String {
        rocket?.firstFlight ?? ""
    }
    
    var fuelTypeA: String {
        return rocket?.engines?.propellantOne ?? ""
    }
    
    var fuelTypeB: String {
        return rocket?.engines?.propellantTwo ?? ""
    }
    
    var height: Double {
        return rocket?.height?.meters ?? 0.0
    }
    
    var diameter: Double {
        return rocket?.diameter?.meters ?? 0.0
    }
}
