//
//  SearchBar.swift
//  jahez_trending_movies
//
//  Created by Hany on 12/7/24.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Search movies...", text: $text)
                .padding(10)
                .foregroundColor(.white)
                .padding(.horizontal, 25)
                .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.gray.opacity(0.3))
                        )
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)

                        if isEditing {
                            Button(action: {
                                text = ""
                                isEditing = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                )
                .onTapGesture {
                    isEditing = true
                }
        }
        .padding(.horizontal)
    }
}
