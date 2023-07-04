//
//  DataFetcher.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 03/07/23.
//

import Foundation

enum DotaError: Error {
    case unableToComplete
    case invalidData
    case invalidResponse
}

protocol DataFetcher {
    func getHeroStats(completion: @escaping (Result<[DotaHeroStat], DotaError>) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func getHeroStats(completion: @escaping (Result<[DotaHeroStat], DotaError>) -> Void) {
        service.request { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            if let data{
                let decodable = try? JSONDecoder().decode(DotaHeroStats.self, from: data)
                completion(.success(decodable ?? DotaHeroStats()))
            }
        }
    }
    
}

