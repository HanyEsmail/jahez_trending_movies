//
//  MovieDetailsView.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import SwiftUI

struct MovieDetailsView: View {
    let movieID: Int
    @StateObject private var viewModel: MovieDetailsViewModel
    @State private var scrollOffset: CGFloat = 0
    
    init(viewModel: MovieDetailsViewModel, movieID: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.movieID = movieID
    }
    
    var body: some View {
        ZStack{
            Color(Color.black).ignoresSafeArea(.all)
            ScrollView {
                
                VStack(spacing: 16) {
                    AsyncImage(url: viewModel.moviePosterURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: UIWindow().bounds.height * 0.45)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            colors: [Color.black.opacity(0.5), Color.clear],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    
                    HStack (alignment: .top, spacing: 16) {
                        AsyncImage(url: viewModel.moviePosterURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: UIWindow().bounds.width * 0.2, height: UIWindow().bounds.height * 0.15)
                        .padding(.leading, 8)
                        .overlay(
                            LinearGradient(
                                colors: [Color.black.opacity(0.5), Color.clear],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        
                        VStack (alignment: .leading, spacing: 8) {
                            Text(viewModel.movieDetails?.originalTitle ?? "")
                                .font(AppTheme.shared.titleFont)
                                .foregroundStyle(.white)
                            Text(viewModel.movieDetails?.genres.map({$0.name}).joined(separator: ",") ?? "")
                                .font(AppTheme.shared.bodyFont)
                                .foregroundStyle(.white)
                        }
                    }//: HStack
                    .frame(width: UIWindow().bounds.width, alignment: .leading)
                    
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.movieDetails?.overview ?? "")
                            .font(AppTheme.shared.bodyFont)
                            .foregroundColor(AppTheme.shared.textColor)
                            .padding(.horizontal, 8)
                    }
                    .frame(width: UIWindow().bounds.width, alignment: .leading)
                    
                    Spacer()
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack(alignment: .top, spacing: 4) {
                            Text("Home page:")
                                .font(AppTheme.shared.bodyFont.bold())
                                .foregroundColor(AppTheme.shared.textColor)
                            Text(viewModel.movieDetails?.homepage ?? "")
                                .font(AppTheme.shared.bodyFont)
                                .foregroundColor(Color.blue)
                            
                        }//: HStack
                        .padding(.horizontal, 8)
                        
                        HStack(alignment: .center, spacing: 4) {
                            Text("Languages:")
                                .font(AppTheme.shared.bodyFont.bold())
                                .foregroundColor(AppTheme.shared.textColor)
                            Text((viewModel.movieDetails?.originalLanguage ?? "") == "en" ? "English" : "Arabic")
                                .font(AppTheme.shared.bodyFont)
                                .foregroundColor(AppTheme.shared.secondaryTextColor)
                            
                        }//: HStack
                        .padding(.horizontal, 8)
                        
                        HStack(alignment: .center, spacing: 4) {
                            HStack(alignment: .center, spacing: 4) {
                                Text("Status:")
                                    .font(AppTheme.shared.bodyFont.bold())
                                    .foregroundColor(AppTheme.shared.textColor)
                                Text(viewModel.movieDetails?.status ?? "")
                                    .font(AppTheme.shared.bodyFont)
                                    .foregroundColor(AppTheme.shared.secondaryTextColor)
                                
                            }//: HStack
                            .padding(.leading, 8)
                            .frame(width: (UIWindow().bounds.width - 16)/1.7, alignment: .leading)
                            HStack(alignment: .center, spacing: 4) {
                                Text("Runtime:")
                                    .font(AppTheme.shared.bodyFont.bold())
                                    .foregroundColor(AppTheme.shared.textColor)
                                Text(String(viewModel.movieDetails?.runtime ?? 0))
                                    .font(AppTheme.shared.bodyFont)
                                    .foregroundColor(AppTheme.shared.secondaryTextColor)
                                
                            }//: HStack
                            .padding(.trailing, 8)
                            
                        }//: HStack
                        
                        HStack(alignment: .center, spacing: 4) {
                            HStack(alignment: .center, spacing: 4) {
                                Text("Budget:")
                                    .font(AppTheme.shared.bodyFont.bold())
                                    .foregroundColor(AppTheme.shared.textColor)
                                Text(String(viewModel.movieDetails?.budget ?? 0))
                                    .font(AppTheme.shared.bodyFont)
                                    .foregroundColor(AppTheme.shared.secondaryTextColor)
                                
                            }//: HStack
                            .padding(.leading, 8)
                            .frame(width: (UIWindow().bounds.width - 16)/1.7, alignment: .leading)
                            HStack(alignment: .center, spacing: 4) {
                                Text("Revenue:")
                                    .font(AppTheme.shared.bodyFont.bold())
                                    .foregroundColor(AppTheme.shared.textColor)
                                Text(String(viewModel.movieDetails?.revenue ?? 0))
                                    .font(AppTheme.shared.bodyFont)
                                    .foregroundColor(AppTheme.shared.secondaryTextColor)
                                
                            }//: HStack
                            .padding(.trailing, 8)
                            
                        }//: HStack
                    }//: VStack
                    .frame(width: UIWindow().bounds.width, alignment: .leading)
                }//: VStack
                
            }
            .background(AppTheme.shared.backgroundColor)
            .onAppear {
                viewModel.fetchMovieDetails(movieID: movieID)
            }
        }//: ZStack
    }
    
}


#Preview {
    ViewBuilder.buildMovieDetailsView(movieID: 11)
}
