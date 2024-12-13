//
//  NetworkManager.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Combine
import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}


final class NetworkManager : NetworkManagerProtocol{
    static let shared = NetworkManager()
    
    private let baseHeaders: [String: String]

    init(headers: [String: String] = [:]) {
        self.baseHeaders = headers
    }

    func fetchData<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        baseHeaders.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw NetworkError.serverError
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
