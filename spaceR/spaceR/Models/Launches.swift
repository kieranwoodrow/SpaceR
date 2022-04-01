//
//  Launches.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/24.
//

import Foundation

struct Launch: Codable {
    let fairlings: Fairlings?
    let links: Links?
    let staticFireDateUtc, details, name, dateUtc, dateLocal: String?
    let success, upcoming: Bool?
    let failures: [Failures?]
    let crew: [Crew?]
    let ships, capsules: [UUID?]
    let flightNumber: Int?
    let cores: [Cores?]
    let id, rocket, launchpad: UUID?
    
    private enum CodingKeys: String, CodingKey {
        case fairlings
        case links
        case staticFireDateUtc = "static_fire_date_utc"
        case details
        case name
        case dateUtc = "date_utc"
        case dateLocal = "date_local"
        case success
        case upcoming
        case failures
        case crew
        case ships
        case capsules
        case flightNumber = "flight_number"
        case cores
        case id
        case rocket
        case launchpad
    }
}

struct Fairlings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [UUID?]
    
    private enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
        case ships
    }
}

struct Links: Codable {
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit, webcast, youtubeId, article, wikipedia: String?
    
    private enum CodingKeys: String, CodingKey {
        case patch
        case reddit
        case flickr
        case presskit
        case webcast
        case youtubeId = "youtube_id"
        case article
        case wikipedia
    }
}

struct Patch: Codable {
    let small, large: String?
}

struct Reddit: Codable {
    let campaign, launch, media, recovery: String?
}

struct Flickr: Codable {
    let small, original: [String?]
}

struct Failures: Codable {
    let time, altitude: Int?
    let reason: String?
}

struct Crew: Codable {
    let crew: UUID?
    let role: String?
}

struct Cores: Codable {
    let core, landpad: UUID?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt, landingSuccess: Bool?
    let landingType: String?
    
    private enum CodingKeys: String, CodingKey {
        case core
        case landpad
        case flight
        case gridfins
        case legs
        case reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
    }
}
