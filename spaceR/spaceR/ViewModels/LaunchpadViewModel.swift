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
    var launchpadCount: Int { return allLaunchpads.count }
    
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
}
