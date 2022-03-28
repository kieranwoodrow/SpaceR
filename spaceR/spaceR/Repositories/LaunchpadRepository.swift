//
//  LaunchpadRepository.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/28.
//

import Foundation

typealias LaunchpadResult = (Result<[Launchpads], APIError>) -> Void

protocol LaunchpadRepositoryType: AnyObject {
    func fetchLaunchpads(completion: @escaping(LaunchpadResult))
}

class LaunchpadRepository: LaunchpadRepositoryType {
    
    func fetchLaunchpads(completion: @escaping (LaunchpadResult)) {
        request(endpoint: Constants.getAllLaunchpadsUrl,
                method: Method.GET,
                completion: completion)
    }
    
    private func request<T: Codable>(endpoint: String,
                                     method: Method,
                                     completion: @escaping((Result<T, APIError>) -> Void)) {
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
