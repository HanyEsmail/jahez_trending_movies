//
//  Genre.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation

struct Genre: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
}

struct GenresResponse: Decodable {
    let genres: [Genre]

    enum CodingKeys: String, CodingKey {
        case genres
    }
}

