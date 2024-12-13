//
//  NetworkError.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case decodingError
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL provided is invalid."
        case .decodingError: return "Failed to decode the response."
        case .serverError: return "Server returned an error."
        }
    }
}

