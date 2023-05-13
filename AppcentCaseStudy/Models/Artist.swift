//
//  Artist.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import Foundation

struct ArtistResponse: Decodable {
    let data: [Artist]
}

struct Artist: Identifiable, Decodable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall: String
    let pictureMedium: String
    let pictureBig: String
    let pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, picture, radio, tracklist, type
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
    }
}
