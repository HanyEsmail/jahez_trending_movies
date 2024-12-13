//
//  AppTheme.swift
//  jahez_trending_movies
//
//  Created by Hany on 08/12/2024.
//
import SwiftUI


extension Color {
    static let maroon = Color(red: 128 / 255, green: 0, blue: 0)
    static let gradient = Gradient(colors: [Color.black, Color(red: 68/255, green: 34/255, blue: 34/255)])
}

class AppTheme {
    static let shared = AppTheme()
    
    // Colors
    let primaryColor = Color.maroon
    let backgroundColor = Color.black
    let cardBackgroundColor = Color.black
    let textColor = Color.white
    let secondaryTextColor = Color.gray
    
    // Fonts
    let headerFont = Font.system(size: 24, weight: .semibold)
    let subheaderFont = Font.system(size: 13, weight: .semibold)
    let titleFont = Font.system(size: 24, weight: .bold)
    let subtitleFont = Font.system(size: 18, weight: .semibold)
    let bodyFont = Font.system(size: 16, weight: .regular)
}

