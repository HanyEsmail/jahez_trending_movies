//
//  Movie.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation


struct TrendingMovieResponse: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let language: String
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let isAdult: Bool
    let backdropPath: String?
    let posterPath: String?
    let genreIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case language = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case isAdult = "adult"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
    }
    
    
    static func sample() -> Movie {
        return Movie(id: 1,
                     title: "Test Movie",
                     originalTitle: "Test Movie",
                     overview: "Test Movie",
                     releaseDate: "1-1-2001",
                     language: "ar",
                     voteAverage: 200,
                     voteCount: 200,
                     popularity: 12,
                     isAdult: false,
                     backdropPath: nil,
                     posterPath: nil,
                     genreIds: [1])
    }
    
}
