//
//  ArtistsVM.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import Foundation

final class ArtistsVM: ObservableObject {
    @Published public var artists: [Artist] = []
    
    func getArtists(genreId id: Int) {
        NetworkManager.shared.fetchArtists(genreId: id) { [weak self] artists, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let artists = artists {
                DispatchQueue.main.async {
                    self?.artists = artists
                }
            }
        }
    }
}
