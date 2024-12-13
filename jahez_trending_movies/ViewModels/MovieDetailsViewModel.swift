//
//  MoviewDetailsViewModel.swift
//  jahez_trending_movies
//
//  Created by Hany on 08/12/2024.
//

import Combine
import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetails: MovieDetails?
    @Published var errorMessage: String?
    @Published var moviePosterURL: URL?
    
    private let movieService: MovieServiceProtocol
    private var cancellables = Set<AnyCancellable>()

   
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }

    func fetchMovieDetails(movieID: Int) {
        movieService.fetchMovieDetails(movieID: movieID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] details in
                self?.movieDetails = details
                self?.updatePosterURL()
            })
            .store(in: &cancellables)
    }
    
    private func updatePosterURL() {
        if let path = movieDetails?.posterPath {
            moviePosterURL = Endpoints.imageURL(for:  path)
        }else {
            moviePosterURL =  nil
        }
    }
}
