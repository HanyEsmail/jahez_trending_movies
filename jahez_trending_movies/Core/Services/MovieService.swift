//
//  MoviewService.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation
import Combine

protocol MovieServiceProtocol {
    func fetchTrendingMovies() -> AnyPublisher<TrendingMovieResponse, Error>
    func fetchGenres() -> AnyPublisher<[Genre], Error>
    func fetchMovieDetails(movieID: Int) -> AnyPublisher<MovieDetails, Error>

}

class MovieService: MovieServiceProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    // Generic method to fetch any endpoint
    private func fetchResource<T: Decodable>(endpoint: String) -> AnyPublisher<T, Error> {
        guard let url = Endpoints.buildURL(for: endpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return networkManager.fetchData(url: url)
    }
    
    func fetchTrendingMovies() -> AnyPublisher<TrendingMovieResponse, Error> {
        return fetchResource(endpoint: Endpoints.Movies.trending)
    }

    func fetchMovieDetails(movieID: Int) -> AnyPublisher<MovieDetails, Error> {
        return fetchResource(endpoint: Endpoints.Movies.details(movieID: movieID))
    }

    func fetchGenres() -> AnyPublisher<[Genre], Error> {
        return fetchResource(endpoint: Endpoints.Genres.list)
                .map { (response: GenresResponse) in response.genres }
                .eraseToAnyPublisher()
    }
    

}
