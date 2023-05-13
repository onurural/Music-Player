//
//  Extensions.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 12.05.2023.
//

import Foundation


extension Int {
    var convertedToMinutes: String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}


//extension UserDefaults {
//    static let favoriteTracksKey = "FavoriteTracks"
//
//    static var favoriteTracks: [TracksDatum] {
//        get {
//            if let data = UserDefaults.standard.data(forKey: favoriteTracksKey),
//               let tracks = try? JSONDecoder().decode([TracksDatum].self, from: data) {
//
//                return tracks
//            }
//            return []
//        }
//        set {
//            if let data = try? JSONEncoder().encode(newValue) {
//                UserDefaults.standard.set(data, forKey: favoriteTracksKey)
//            } else {
//                UserDefaults.standard.removeObject(forKey: favoriteTracksKey)
//            }
//        }
//    }
//}

