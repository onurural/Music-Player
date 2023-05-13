//
//  ArtistDetail.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import Foundation

struct ArtistDetail: Decodable {
    var id: Int?
    var name: String?
    var link: String?
    var share: String?
    var picture: String?
    var pictureSmall: String?
    var pictureMedium: String?
    var pictureBig: String?
    var pictureXl: String?
    var nbAlbum: Int?
    var nbFan: Int?
    var radio: Bool?
    var tracklist: String?
    var type: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture, radio, tracklist, type
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case nbAlbum = "nb_album"
        case nbFan = "nb_fan"
    }
}







