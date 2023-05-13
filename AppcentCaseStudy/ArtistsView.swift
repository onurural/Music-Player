//
//  ArtistsView.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import SwiftUI

struct ArtistsView: View {
    @StateObject private var vm = ArtistsVM()
    var genreId: Int
    var genreName: String
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(vm.artists, id: \.id) { artist in
                    NavigationLink(destination: ArtistDetailView(artistId: artist.id, name: artist.name)) {
                        ArtistCell(artist: artist)
                    }
                }
            }
            .padding()
            .navigationTitle("\(genreName) Artists 🎸")
            .onAppear {
                vm.getArtists(genreId: genreId)
            }
        }
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(genreId: 132, genreName: "Hip-Hop")
    }
}
