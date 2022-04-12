//
//  HistoryRepository.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation

typealias HistoryResult = (Result<[History], CustomError>) -> Void

protocol HistoryRepositoryType: AnyObject {
    func fetchHistory(completion: @escaping(HistoryResult))
}

class HistoryRepository: HistoryRepositoryType {
    
    func fetchHistory(completion: @escaping (HistoryResult)) {
        request(endpoint: Constants.getHistoryUrl,
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

