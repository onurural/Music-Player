//
//  FavouriteTracksView.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import SwiftUI

struct FavouriteTracksView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var vm = AlbumDetailVM()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.favouriteTracks, id: \.id) { track in
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
                                    Button(
                                        action: {
                                            vm.playAudio(fromURL: previewURL)
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
                                            vm.removeFromUserDefaults(track)
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
        .onAppear {
            vm.getFavouriteTracks()
        }
    }
}

struct FavouriteTracksView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteTracksView()
    }
}
