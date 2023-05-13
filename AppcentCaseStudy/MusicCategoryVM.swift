//
//  MusicCategoryViewModel.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import Foundation

final class MusicCategoryVM: ObservableObject {
    @Published public var genres: [Genre] = []
    @Published public var tabIndex = 0
    func getGenres() {
        NetworkManager.shared.fetchGenres { [weak self] genres, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let genres = genres {
                DispatchQueue.main.async {
                    self?.genres = genres
                }
            }
        }
    }
}
