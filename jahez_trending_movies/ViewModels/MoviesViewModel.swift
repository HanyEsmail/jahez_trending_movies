//
//  TrendingMoviesViewModel.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation
import Combine

class TrendingMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var filteredMovies: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var searchQuery: String = ""
    @Published var selectedGenre: Int? = nil         
    
    private var cancellables = Set<AnyCancellable>()
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
        fetchMovies()
        fetchGenres()
        setupBindings()
    }
    
    /// Fetch movies from API
    func fetchMovies() {
        movieService.fetchTrendingMovies()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch movies: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] moviesResponse in
                self?.movies = moviesResponse.movies
                self?.filteredMovies = moviesResponse.movies
            })
            .store(in: &cancellables)
    }
    
    /// Fetch genres from API
    func fetchGenres() {
        movieService.fetchGenres()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch genres: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] genres in
                self?.genres = genres
            })
            .store(in: &cancellables)
    }
    
    /// Set up Combine bindings for search and genre filtering
    private func setupBindings() {
        Publishers.CombineLatest($searchQuery, $selectedGenre)
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main) // For smoother typing
            .map { [weak self] query, genreID in
                self?.filterMovies(searchQuery: query, selectedGenreID: genreID) ?? []
            }
            .assign(to: &$filteredMovies)
    }
    
    /// Filter movies based on search query and genre
    private func filterMovies(searchQuery: String, selectedGenreID: Int?) -> [Movie] {
        var filtered = movies
        
        // Apply genre filter if a genre is selected
        if let genreID = selectedGenreID {
            filtered = filtered.filter {
                $0.genreIds.contains(genreID)
            }
        }
        
        // Apply search filter if searchQuery is not empty
        if !searchQuery.isEmpty {
            filtered = filtered.filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
        }
        
        return filtered
    }
}

