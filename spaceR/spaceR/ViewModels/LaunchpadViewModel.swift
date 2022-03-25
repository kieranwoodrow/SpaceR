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
    
    var launchpadList: [Launchpads] { return allLaunchpads }
    
    var launchpadCount: Int { return allLaunchpads.count }
    
    func getLaunchpadImage(atIndex: Int) -> String {
        var launchpadImage = ""
        if let safeImage = allLaunchpads[atIndex].images?.largeImage.randomElement() {
            launchpadImage = safeImage ?? ""
        }
        return launchpadImage
    }
    
    func getLaunchpadTitle(atIndex: Int) -> String {
        return allLaunchpads[atIndex].lauchpadName ?? ""
    }
}
