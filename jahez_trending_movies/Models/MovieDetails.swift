//
//  MovieDetails.swift
//  jahez_trending_movies
//
//  Created by Hany on 08/12/2024.
//
struct MovieDetails: Decodable {
    let adult: Bool
    let backdropPath: String?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]

    enum CodingKeys: String, CodingKey {
        case adult, budget, genres, homepage, id, overview, popularity, revenue, runtime, status, title, voteAverage = "vote_average", voteCount = "vote_count", originalLanguage = "original_language", originalTitle = "original_title", releaseDate = "release_date", posterPath = "poster_path", backdropPath = "backdrop_path", spokenLanguages = "spoken_languages", productionCompanies = "production_companies", productionCountries = "production_countries"
    }
}

struct SpokenLanguage: Decodable {
    let englishName: String
    let iso6391: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
        case name
    }
}

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

struct ProductionCountry: Decodable {
    let iso31661: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name
    }
}
