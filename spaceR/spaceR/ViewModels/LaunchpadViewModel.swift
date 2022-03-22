//
//  LaunchpadViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/21.
//

import Foundation

class LaunchpadViewModel {
    
    private var allLaunchpads: [Launchpads]
    
    init() {
        self.allLaunchpads = []
    }
    
    func setAllLaunchpads(launchpads: [Launchpads]) {
        allLaunchpads = launchpads
    }
    
    func getAllRockets() -> [Launchpads] {
        return allLaunchpads
    }
    
    func getLaunchpadCount() -> Int {
        return allLaunchpads.count
    }
    
    func getLaunchpadName(index: Int) -> String {
        return allLaunchpads[index].lauchpadName ?? ""
    }
    
    func getLaunchpadImage(index: Int) -> String {
        var launchpadImage = ""
        if let safeImage = allLaunchpads[index].images?.largeImage.randomElement() {
            launchpadImage = safeImage ?? ""
        }
        return launchpadImage
    }
    
    func getLaunchpadTitle(index: Int) -> String {
        return allLaunchpads[index].lauchpadName ?? ""
    }
    
    func getLaunchpadLocation(index: Int) -> String {
        return allLaunchpads[index].location ?? "Location not found"
    }
    
    func getLaunchpadRegion(index: Int) -> String {
        return allLaunchpads[index].region ?? "This region is undisclosed"
    }
    
    func getLaunchpadDetails(index: Int) -> String {
        return  allLaunchpads[index].details ?? "This launch has no details"
    }
    
    func getLaunchAttempts(index: Int) -> Int {
        return allLaunchpads[index].launchAttempts ?? 0
    }
    
    func getLauchSuccessRate(index: Int) -> Int {
        return allLaunchpads[index].launchSuccesses ?? 0
    }
    
    func getLauchpadLogitude(index: Int) -> Double {
        return allLaunchpads[index].longitude ?? 0.0
    }
}
