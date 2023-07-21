//
//  NetworkManager.swift
//  TestKingfisher
//
//  Created by Алексей Турулин on 7/20/23.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchData(completion: @escaping (Result<[Superhero], NetworkError>) -> Void) {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data  else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            do {
                let superheroes = try JSONDecoder().decode([Superhero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(superheroes))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
