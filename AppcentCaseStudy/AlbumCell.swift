//
//  AlbumCell.swift
//  AppcentCaseStudy
//
//  Created by Onur Ural on 11.05.2023.
//

import SwiftUI

struct AlbumCell: View {
    @Environment(\.colorScheme) var colorScheme
    var track: Track
    var body: some View {
        NavigationLink(destination: AlbumDetailView(albumId: track.album?.id ?? -1)) {
            HStack(spacing: 0) {
                if let mediumCover = track.album?.coverMedium {
                    AsyncImage(url: URL(string: mediumCover)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width * 0.2)
                }
                Divider()
                if let trackTitle = track.title {
                    HStack {
                        Text(trackTitle)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    
                }
            }
        }
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCell(track: Track(id: 1766693507, readable: true, title: "Rastgele", titleShort: "Rastgele", titleVersion: "", link: "https://www.deezer.com/track/1766693507", duration: 137, rank: 559489, explicitLyrics: false, explicitContentLyrics: 0, explicitContentCover: 2, preview: "https://cdns-preview-0.dzcdn.net/stream/c-0f2a5a27a3446ecb5b6da544b69482f2-3.mp3", contributors: nil, md5Image: "51fb09e2fae23c60702fb63a6572baae", artist: TrackArtist(id: 5618818, name: "Burak Bulut", tracklist: "https://api.deezer.com/artist/5618818/top?limit=50", type: "artist"), album: nil, type: nil))
    }
}
