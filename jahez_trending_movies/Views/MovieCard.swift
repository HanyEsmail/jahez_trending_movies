//
//  MovieCard.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//
import SwiftUI


struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                // Movie Poster Image
                AsyncImage(url: Endpoints.imageURL(for: movie.posterPath ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3) 
                }
                .frame(height: 180)
                .clipped()
                
                // Overlay Color
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            }
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            
            // Text Area
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(movie.releaseDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 8)
            .frame(height: 60)
        }
        .background(Color.black.opacity(0.8))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.maroon, lineWidth: 1)
        )
        .padding(4)
    }
}

#Preview {
    MovieCard(movie: Movie.sample()).preferredColorScheme(.dark);
}
