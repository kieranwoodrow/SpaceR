//
//  ServiceErrors.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/17.
//

import Foundation

enum APIError: String, Error {
    case invalidResponse
    case invalidRequest
    case invalidUrl
    case invalidData
    case internalError
    case parsingError
}

enum Method {
    case GET
    case POST
}
