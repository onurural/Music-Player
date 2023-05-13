//
//  AlbumDetailView.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import SwiftUI

struct AlbumDetailView: View {
    @StateObject var vm = AlbumDetailVM()
    @Environment(\.colorScheme) var colorScheme
    var albumId: Int
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.tracks, id: \.id) { track in
                    if let title = track.title, let duration = track.duration, let imageURL = track.album?.coverMedium {
                        HStack {
                            AsyncImage(url: URL(string: imageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Color.gray
                            }
                            
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            if let url = track.preview {
                                let previewString = url.replacingOccurrences(of: "\\/", with: "/")
                                let previewURL = URL(string: previewString)!
                                HStack {
                                    Spacer()
                                    Button(
                                        action: {
                                            if let id = track.id {
                                                vm.toggleIsPlaying(id)
                                                track.isPlaying ? vm.stopAudio() : vm.playAudio(fromURL: previewURL)
                                            }
                                        },
                                        label: {
                                            VStack {
                                                Text(title)
                                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                                Text(duration.convertedToMinutes)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    )
                                    
                                    Spacer()
                                    Button(
                                        action: {
                                            if let id = track.id {
                                                vm.toggleFavourite(id)
                                            }
                                        },
                                        label: {
                                            if let isLiked = track.isLiked {
                                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                                    .foregroundColor(.red)
                                            }
                                            
                                        }
                                    )
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.6)
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(vm.albumName)
        .onAppear{
            vm.getArtists(albumId: albumId)
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(albumId: 322004617)
    }
}
