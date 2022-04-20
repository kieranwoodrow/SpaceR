//
//  History.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation

struct History: Codable {
    let title: String?
    let eventDate: String?
    let details:String?
    let links: Article?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case eventDate = "event_date_utc"
        case details
        case links
    }
}

struct Article: Codable {
    let article: String?
}
