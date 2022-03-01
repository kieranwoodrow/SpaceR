//
//  Launches.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/24.
//

import Foundation

struct Launch: Codable{
    let fairlings: Fairlings?
    let links: Links?
    let static_fire_date_utc, details, name, date_utc, date_local: String?
    let success, upcoming: Bool?
    let failures: [Failures?]
    let crew: [Crew?]
    let ships, capsules: [UUID?]
    let flight_number: Int?
    let cores: [Cores?]
    let id, rocket, launchpad: UUID?
}

struct Fairlings: Codable{
    let reused, recovery_attempt, recovered: Bool?
    let ships: [UUID?]
}

struct Links: Codable{
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit, webcast, youtube_id, article, wikipedia: String?
}

struct Patch: Codable{
    let small, large: String?
}

struct Reddit: Codable{
    let campaign, launch, media, recovery: String?
}

struct Flickr: Codable{
    let small, original: [String?]
}

struct Failures: Codable{
    let time, altitude: Int?
    let reason: String?
}

struct Crew: Codable{
    let crew: UUID?
    let role: String?
}

struct Cores: Codable{
    let core, landpad: UUID?
    let flight: Int?
    let gridfins, legs, reused, landing_attempt, landing_success: Bool?
    let landing_type: String?
}


