//
//  Launchpads.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/16.
//

import Foundation

struct Launchpads: Codable {
    
    let launchID: String?
    let lauchpadName: String?
    let launchpadStatus: String?
    let location: String?
    let region: String?
    let timezone: String?
    let latitude: Double?
    let longitude: Double?
    let launchAttempts: Int?
    let launchSuccesses: Int?
    let rocketsLaunched: [UUID?]
    let launches: [UUID?]
    let details: String?
    let images: Images?
    
    private enum CodingKeys: String, CodingKey {
        case lauchpadName = "full_name"
        case launchpadStatus = "status"
        case location = "locality"
        case region
        case timezone
        case latitude
        case longitude
        case launchAttempts = "launch_attempts"
        case launchSuccesses = "launch_successes"
        case rocketsLaunched = "rockets"
        case launches
        case details
        case launchID = "id"
        case images
    }
}

struct Images: Codable {
    let largeImage: [String?]
    
    private enum CodingKeys: String, CodingKey {
        case largeImage = "large"
    }
}
