//
//  Album.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import Foundation

struct ArtistAlbum: Codable {
    let id: Int?
    let title, upc: String?
    let link, share, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let genreID: Int?
    let genres: Genres?
    let label: String?
    let nbTracks, duration, fans: Int?
    let releaseDate, recordType: String?
    let available: Bool?
    let tracklist: String?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let contributors: [AlbumContributor]?
    let artist: AlbumArtist?
    let type: String?
    let tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case genres, label
        case nbTracks = "nb_tracks"
        case duration, fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case available, tracklist
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case contributors, artist, type, tracks
    }
}

// MARK: - Artist
struct AlbumArtist: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let tracklist: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}

// MARK: - Contributor
struct AlbumContributor: Codable {
    let id: Int?
    let name: String?
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type, role: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, role
    }
}

// MARK: - Genres
struct Genres: Codable {
    let data: [ArtistElement]?
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let type: String?
    let tracklist: String?
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]?
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int?
    let readable: Bool?
    let title, titleShort, titleVersion: String?
    let link: String?
    let duration: Int? 
    let rank: Int?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
    let md5Image: String?
    let artist: ArtistElement?
    let album: TrackAlbum?
    let type: String?
    var isLiked: Bool
    var isPlaying: Bool

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type, isLiked, isPlaying
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            // Decode properties using the coding keys
            id = try container.decodeIfPresent(Int.self, forKey: .id)
            readable = try container.decodeIfPresent(Bool.self, forKey: .readable)
            title = try container.decodeIfPresent(String.self, forKey: .title)
            titleShort = try container.decodeIfPresent(String.self, forKey: .titleShort)
            titleVersion = try container.decodeIfPresent(String.self, forKey: .titleVersion)
            link = try container.decodeIfPresent(String.self, forKey: .link)
            duration = try container.decodeIfPresent(Int.self, forKey: .duration)
            rank = try container.decodeIfPresent(Int.self, forKey: .rank)
            explicitLyrics = try container.decodeIfPresent(Bool.self, forKey: .explicitLyrics)
            explicitContentLyrics = try container.decodeIfPresent(Int.self, forKey: .explicitContentLyrics)
            explicitContentCover = try container.decodeIfPresent(Int.self, forKey: .explicitContentCover)
            preview = try container.decodeIfPresent(String.self, forKey: .preview)
            md5Image = try container.decodeIfPresent(String.self, forKey: .md5Image)
            artist = try container.decodeIfPresent(ArtistElement.self, forKey: .artist)
            album = try container.decodeIfPresent(TrackAlbum.self, forKey: .album)
            type = try container.decodeIfPresent(String.self, forKey: .type)
            isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
            isPlaying = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
        }
    
    init(id: Int?, readable: Bool?, title: String?, titleShort: String?, titleVersion: String?, link: String?, duration: Int?, rank: Int?, explicitLyrics: Bool?, explicitContentLyrics: Int?, explicitContentCover: Int?, preview: String?, md5Image: String?, artist: ArtistElement?, album: TrackAlbum?, type: String?, isLiked: Bool = false, isPlaying: Bool = false) {
        self.id = id
        self.readable = readable
        self.title = title
        self.titleShort = titleShort
        self.titleVersion = titleVersion
        self.link = link
        self.duration = duration
        self.rank = rank
        self.explicitLyrics = explicitLyrics
        self.explicitContentLyrics = explicitContentLyrics
        self.explicitContentCover = explicitContentCover
        self.preview = preview
        self.md5Image = md5Image
        self.artist = artist
        self.album = album
        self.type = type
        self.isLiked = isLiked
        self.isPlaying = isPlaying
    }
}

// MARK: - Album
struct TrackAlbum: Codable {
    let id: Int?
    let title: String?
    let cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let tracklist: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
}
