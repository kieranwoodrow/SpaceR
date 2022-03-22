//
//  Endpoints.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/17.
//

import Foundation

extension URLSession {
    
    enum CustomError: Error {
        case invalidResponse
        case invalidRequest
        case invalidUrl
        case invalidData
    }
    
    func getDataFromApi<Generic: Codable>(url: URL?,
                                          model: Generic.Type,
                                          completion: @escaping (Result<Generic, Error>) -> Void) {
        
        guard let endpointUrl = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let apiTask = self.dataTask(with: endpointUrl) { data, _, error in
            guard let safeData = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(model, from: safeData)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                
            } catch {
                completion(.failure(error))
            }
            
        }
        apiTask.resume()
    }
}
