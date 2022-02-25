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
    let name, type, first_flight, country, company, wikipedia, description, id: String?
    let active: Bool?
    let stages, boosters, cost_per_launch, success_rate_pct: Int?
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


//Questions
//1) //What do you put if you don't know what number type api is returning? The spaceX api scheme just says number (assuming typescript type)
        //i.e, will it break if you declare double but receives an into or will it typecast it

//2)//Do you put Array module here and use everywhere. eg var rockets = [Rocket] instead of in controller


