//
//  Constants.swift
//  SpaceX_Project
//
//  Created by Kieran Woodrow on 2022/02/17.
//

import Foundation

struct Constants{
    //Endpoint URl for getting ALL rockets
    static let getAllRocketsUrl = URL(string: "https://api.spacexdata.com/v4/rockets")
    //Endpoint URl for getting ALL rocket launches
    static let getAllLaunchesUrl = URL(string: "https://api.spacexdata.com/v5/launches")
}

