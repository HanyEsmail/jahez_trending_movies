//
//  Endpoints.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation


struct Endpoints {
    static private let baseURL = "https://api.themoviedb.org/3/"
    static private let imagebaseURL = "https://image.tmdb.org/t/p/w500"
    static let header = ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmNjZjAwYTI5YTBiZDFhYTUyOWI4YWJmYTFhMTExZCIsIm5iZiI6MTczMzU5MjkyNy42ODcsInN1YiI6IjY3NTQ4NzVmZGYzYWU5N2UxYzJmNTY1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VWPlO5ZOAX7x4Ms0YF-KQgow3V6n1VWuIqiKUaq6hws",
                      "accept": "application/json"]
    
    struct Movies {
        static let trending = "discover/movie?include_adult=false&sort_by=popularity.desc"
        static func details(movieID: Int) -> String {
            return "movie/\(movieID)"
        }
    }

    struct Genres {
        static let list = "genre/movie/list"
    }
}

extension Endpoints {
    static func buildURL(for path: String, queryItems: [URLQueryItem]? = nil) -> URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = queryItems
        return components?.url
    }
}

extension Endpoints {
    static func imageURL(for path: String) -> URL? {
        let components = URLComponents(string: imagebaseURL + path)
        return components?.url//URL(string: fullImageURL)
    }
}
