//
//  RocketRepository.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/28.
//

import Foundation

typealias RocketResult = (Result<[Rocket], CustomError>) -> Void

protocol RocketRepositoryType: AnyObject {
    func fetchRockets(completion: @escaping(RocketResult))
}

class RocketRepository: RocketRepositoryType {
    
    func fetchRockets(completion: @escaping (RocketResult)) {
        request(endpoint: Constants.getAllRocketsUrl,
                method: Method.GET,
                completion: completion)
    }
    
    private func request<T: Codable>(endpoint: String,
                                     method: Method,
                                     completion: @escaping((Result<T, CustomError>) -> Void)) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.internalError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        call(with: request, model: T.self, completion: completion)
    }
}
