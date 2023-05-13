//
//  ArtistDetailVM.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import Foundation

final class ArtistDetailVM: ObservableObject {
    @Published public var artistDetail = ArtistDetail()
    @Published public var tracks: [Track] = []
    
    func getArtistDetail(artistId id: Int) {
        NetworkManager.shared.fetchArtistDetails(artistId: id) { [weak self] artistDetail, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let artistDetail = artistDetail {
                DispatchQueue.main.async {
                    self?.artistDetail = artistDetail
                }
                
                if let trackUrl = artistDetail.tracklist {
                    self?.getTracks(trackListUrl: trackUrl)
                }
            }
            
            
        }
    }
    
    fileprivate func getTracks(trackListUrl url: String) {
        NetworkManager.shared.fetchTopTracks(trackListURL: url) { [weak self] tracks, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let tracks = tracks {
                DispatchQueue.main.async {
                    self?.tracks = tracks
                }
            }
        }
    }
}
