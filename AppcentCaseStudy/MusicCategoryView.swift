//
//  MusicCategoryView.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import SwiftUI

struct MusicCategoryView: View {
    
    @StateObject private var vm = MusicCategoryVM()
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            TabView(selection: $vm.tabIndex) {
                genreTab()
                    .tabItem {
                        Image(systemName: "music.note")
                        Text("Genres")
                    }
                    .tag(0)
                FavouriteTracksView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Liked Tracks")
                    }
                    .tag(1)
            }
            .navigationTitle($vm.tabIndex.wrappedValue == 0 ? "Genres 🎶" : "Favorite Tracks ❤️")
            
        }
        .onAppear {
            vm.getGenres()
        }
    }
    
    
    fileprivate func genreTab() -> ScrollView<some View> {
        return ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(vm.genres, id: \.id) { genre in
                    if let id = genre.id, let name = genre.name {
                        NavigationLink(destination: ArtistsView(genreId: id, genreName: name)) {
                            CategoryCell(genre: genre)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct MusicCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MusicCategoryView()
    }
}
