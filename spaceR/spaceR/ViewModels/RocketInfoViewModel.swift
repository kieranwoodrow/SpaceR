//
//  RocketInfoViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/01.
//

import Foundation

class RocketInfoViewModel {
    
    private var rocket: Rocket?
    private weak var delegate: ViewModelDelegate?
    private var heading = ""
    private var info = ""
    private var headings = ["First Flight", "Cost Per Launch", "Success Rate",
                            "Fuel Type A", "Fuel Type B", "Mass", "Height",
                            "Diameter", "Active" ]
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    func set(rocket: Rocket) {
        self.rocket = rocket
    }
    
    var headingsCount: Int {
        return headings.count
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
    
    var rocketImage: String {
        var rocketImage = ""
        if let safeImage = rocket?.images.randomElement() {
            rocketImage = safeImage ?? ""
        }
        return rocketImage
    }
    
    var image: URL? {
        return URL(string: (rocket?.images.randomElement() ?? "") ?? "")
    }
    
    func setHeadings(indexPath: Int) -> [String: String] {
        switch indexPath {
        case indexPath where indexPath == 0:
            heading = headings[0]
            info = self.firstFlight
        case indexPath where indexPath == 1:
            heading = headings[1]
            info = "$" + String(self.launchCost)
        case indexPath where indexPath == 2:
            heading = headings[2]
            info = String(self.successRate) + "%"
        case indexPath where indexPath == 3:
            heading = headings[3]
            info = self.fuelTypeA
        case indexPath where indexPath == 4:
            heading = headings[4]
            info = self.fuelTypeB
        case indexPath where indexPath == 5:
            heading = headings[5]
            info = String(self.mass) + "kg"
        case indexPath where indexPath == 6:
            heading = headings[6]
            info = String(self.height) + "m"
        case indexPath where indexPath == 7:
            heading = headings[7]
            info = String(self.diameter) + "m"
        case indexPath where indexPath == 8:
            heading = headings[8]
            info = String(self.status)
        default:
            heading = ""
            info = ""
        }
        return ["heading":heading,"info": info]
    }
}
