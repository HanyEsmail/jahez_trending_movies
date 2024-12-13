//
//  ChipGroup.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation
import SwiftUI

struct ChipGroup: View {
    let genres: [Genre]
    @Binding var selectedGenre: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(genres, id: \.id) { genre in
                    ChipView(genre: genre, isSelected: selectedGenre == genre.id) {
                        selectedGenre = (selectedGenre == genre.id) ? nil : genre.id
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ChipView: View {
    let genre: Genre
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Text(genre.name)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isSelected ? Color.white : Color.clear)
            .foregroundColor(isSelected ? Color(red: 88/255, green: 24/255, blue: 24/255) : .white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 88/255, green: 24/255, blue: 24/255), lineWidth: 1)
            )
            .cornerRadius(16)
            .onTapGesture {
                action()
            }
    }
}

