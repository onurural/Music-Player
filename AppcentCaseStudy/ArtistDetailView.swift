//
//  ArtistDetailView.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import SwiftUI

struct ArtistDetailView: View {
    @StateObject private var vm = ArtistDetailVM()
    var artistId: Int
    var name: String
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        
        ScrollView {
            VStack {
                if let imageURL = vm.artistDetail.pictureBig {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                }
                Divider()
                ForEach(vm.tracks, id: \.id) { track in
                    if let track = track {
                        AlbumCell(track: track)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            vm.getArtistDetail(artistId: artistId) 
        }
        .navigationTitle(name)
        
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artistId: 5618818, name: "Burak Bulut")
    }
}
