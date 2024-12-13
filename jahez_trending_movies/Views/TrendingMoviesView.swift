//
//  TrendingMoviesView.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation
import SwiftUI

struct TrendingMoviesView: View {
    @StateObject private var viewModel: TrendingMoviesViewModel
   
    init(viewModel: TrendingMoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    private let gradient = LinearGradient(
        gradient:Color.gradient,
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        NavigationView {
            
            ZStack{
                // Background gradient
                gradient.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    SearchBar(text: $viewModel.searchQuery)
                        .padding(.horizontal)
                    
                    // Title
                    Text("Watch New Movies")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                    
                    ChipGroup(genres: viewModel.genres, selectedGenre: $viewModel.selectedGenre)
                    
                    
                    // Movies Grid
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                            ForEach(viewModel.filteredMovies){ movie in
                                NavigationLink(destination:  ViewBuilder.buildMovieDetailsView(movieID: movie.id)) {
                                    MovieCard(movie: movie)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .task {
                viewModel.fetchMovies()
                viewModel.fetchGenres()
            }
            
        }
    }
}

#Preview {
    ViewBuilder.buildMoviesView();
}

