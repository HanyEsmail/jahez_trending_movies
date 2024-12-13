//
//  Compose.swift
//  jahez_trending_movies
//
//  Created by Hany on 07/12/2024.
//

import Foundation
import SwiftUI

struct ViewBuilder {
    static let header = ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmNjZjAwYTI5YTBiZDFhYTUyOWI4YWJmYTFhMTExZCIsIm5iZiI6MTczMzU5MjkyNy42ODcsInN1YiI6IjY3NTQ4NzVmZGYzYWU5N2UxYzJmNTY1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VWPlO5ZOAX7x4Ms0YF-KQgow3V6n1VWuIqiKUaq6hws",
                      "accept": "application/json"]

    static func buildMoviesView() -> some View {
        let networkManager = NetworkManager(headers: header)
        let movieService = MovieService(networkManager: networkManager)
        let viewModel = TrendingMoviesViewModel(movieService:  movieService)
        return TrendingMoviesView(viewModel: viewModel)
    }
    
    static func buildMovieDetailsView(movieID: Int) -> some View {
        let networkManager = NetworkManager(headers: header)
        let movieService = MovieService(networkManager: networkManager)
        let viewModel = MovieDetailsViewModel(movieService:  movieService)
        return MovieDetailsView(viewModel: viewModel, movieID: movieID)
    }
}
