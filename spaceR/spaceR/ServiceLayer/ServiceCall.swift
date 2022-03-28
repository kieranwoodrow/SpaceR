//
//  ServiceCall.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/28.
//

import Foundation

func call<Generic: Codable>(with request: URLRequest, model: Generic.Type,
                            completion: @escaping((Result<Generic, APIError>) -> Void)) {
    
    let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
        guard error == nil else {
            completion(.failure(.invalidUrl))
            return
        }
        do {
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            let object = try JSONDecoder().decode(model, from: data)
            completion(Result.success(object))
        } catch {
            completion(Result.failure(.parsingError))
        }
    }
    dataTask.resume()
}
