//
//  NetworkService.swift
//  Dota2Heroes
//
//  Created by Sayyid Maulana Khakul Yakin on 29/06/23.
//

import Foundation

protocol Service {
    func request(completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class NetworkService: Service {
    private let urlString = "https://api.opendota.com/api/herostats"
    
    func request(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = createTask(url: url, completion: completion)
        task.resume()
    }
    
    private func createTask(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        
        return URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
}
