//
//  Rocket.swift
//  SpaceR Priject
//  Created by Kieran Woodrow on 2022/02/17.
//

import Foundation

struct Rocket: Codable{
    let height: Height?
    let diameter: Diameter?
    let mass: Mass?
    let first_stage: FirstStage?
    let second_stage: SecondStage?
    let engines: Engines?
    let landing_legs: LandingLegs?
    let payload_weights: [PayloadWeight?]
    let flickr_images: [String?]
    let name: String?
    let type: String?
    let active: Bool?
    let stages: Int?
    let boosters: Int?
    let cost_per_launch: Int?
    let success_rate_pct: Int?
    let first_flight: String?
    let country: String?
    let company: String?
    let wikipedia: String?
    let description: String?
    let id: String?
}

struct Height: Codable{
    let meters, feet: Double?
}

struct Diameter: Codable{
    let meters, feet: Double?
}

struct Mass: Codable{
    let kg, lb: Double?
}

struct FirstStage: Codable{
    let thrust_sea_level: ThrustSeaLevel?
    let thrust_vacuum: ThrustVacuum?
    let reusabe: Bool?
    let engines: Int?
    let fuel_amount_tons, burn_time_sec: Double?
}

struct ThrustSeaLevel: Codable{
    let kN, lbf: Double?
}

struct ThrustVacuum: Codable{
    let kN, lbf: Double?
}

struct SecondStage: Codable{
    let thrust: Thrust?
    let payloads: Payloads?
    let reusabe: Bool?
    let engines: Int?
    let fuel_amount_tons, burn_time_sec: Double?
}

struct Thrust: Codable{
    let kg, lb: Double?
}

struct Payloads: Codable{
    let composite_fairing: CompositeFairing?
}

struct CompositeFairing: Codable{
    let option_1: String?
    let height: Height?
    let diameter: Diameter?
}

struct Engines: Codable{
    let isp: ISP?
    let thrust_sea_level: ThrustSeaLevel?
    let thrust_vacuum: ThrustVacuum?
    let number, engine_loss_max: Int?
    let type, version, layout, propellant_1, propellant_2: String?
    let thrust_to_weight: Double?
}
struct ISP: Codable{
    let sea_level, vacuum: Double?
}

struct LandingLegs: Codable{
    let number: Int?
    let material: String?
}

struct PayloadWeight: Codable{
    let id, name: String?
    let kg, lb: Double?
}

