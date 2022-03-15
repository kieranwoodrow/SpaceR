//
//  Rocket.swift
//  SpaceR 
//  Created by Kieran Woodrow on 2022/02/17.
//

import Foundation

struct Rocket: Codable {
    let height: Height?
    let diameter: Diameter?
    let mass: Mass?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight?]
    let images: [String?]
    let name, type, firstFlight, country, company, wikipedia, description, id: String?
    let active: Bool?
    let stages, boosters, costPerLaunch, successRatePercentage: Int?
    
    private enum CodingKeys: String, CodingKey {
        case height
        case diameter
        case mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case images = "flickr_images"
        case name
        case type
        case firstFlight = "first_flight"
        case country
        case company
        case wikipedia
        case description
        case id
        case active
        case stages
        case boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePercentage = "success_rate_pct"
    }
}

struct Height: Codable {
    let meters, feet: Double?
}

struct Diameter: Codable {
    let meters, feet: Double?
}

struct Mass: Codable {
    let kg, lb: Double?
}

struct FirstStage: Codable {
    let thrustSeaLevel: ThrustSeaLevel?
    let thrustVacuum: ThrustVacuum?
    let reusabe: Bool?
    let engines: Int?
    let fuelAmountInTons, burnTimeInSeconds: Double?
    
    private enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusabe
        case engines
        case fuelAmountInTons = "fuel_amount_tons"
        case burnTimeInSeconds = "burn_time_sec"
    }
}

struct ThrustSeaLevel: Codable {
    let kN, lbf: Double?
}

struct ThrustVacuum: Codable {
    let kN, lbf: Double?
}

struct SecondStage: Codable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusabe: Bool?
    let engines: Int?
    let fuelAmountInTons, burnTimeInSeconds: Double?
    
    private enum CodingKeys: String, CodingKey {
        case thrust
        case payloads
        case reusabe
        case engines
        case fuelAmountInTons = "fuel_amount_tons"
        case burnTimeInSeconds = "burn_time_sec"
    }
}

struct Thrust: Codable {
    let kg, lb: Double?
}

struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    
    private enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
    }
}

struct CompositeFairing: Codable {
    let optionOne: String?
    let height: Height?
    let diameter: Diameter?
    
    private enum CodingKeys: String, CodingKey {
        case optionOne = "option_1"
        case height
        case diameter
    }
}

struct Engines: Codable {
    let ispEngine: ISPEngine?
    let thrustSeaLevel: ThrustSeaLevel?
    let thrustVacuum: ThrustVacuum?
    let number, engineLossMax: Int?
    let type, version, layout, propellantOne, propellantTwo: String?
    let thrustToWeight: Double?
    
    private enum CodingKeys: String, CodingKey {
        case ispEngine = "isp"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number
        case engineLossMax = "engine_loss_max"
        case type
        case version
        case layout
        case propellantOne = "propellant_1"
        case propellantTwo = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

struct ISPEngine: Codable {
    let seaLevel, vacuum: Double?
    
    private enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

struct LandingLegs: Codable {
    let number: Int?
    let material: String?
}

struct PayloadWeight: Codable {
    let id, name: String?
    let kg, lb: Double?
}
