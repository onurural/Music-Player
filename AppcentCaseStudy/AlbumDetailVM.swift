//
//  AlbumDetailVM.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//


import Foundation
import AVFoundation

final class AlbumDetailVM: ObservableObject {
    @Published public var tracks: [TracksDatum] = []
    @Published public var albumName: String = ""
    @Published public var favouriteTracks: [TracksDatum] = []
    
    private var player: AVPlayer?
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let favoriteTracksKey = "FavoriteTracks"
    private var lastTrackIndex: Int?
    
    public func getArtists(albumId id: Int) {
        NetworkManager.shared.fetchAlbumDetail(albumId: id) { [weak self] album, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            if let albumName = album?.title {
                DispatchQueue.main.async {
                    self?.albumName = albumName
                }
            }
            
            if var tracks = album?.tracks?.data {
                DispatchQueue.main.async {
                    _ = tracks.map { track in
                        guard let vm = self else { return }
                        let isFavorite = vm.checkIsFavorite(track)
                        if(isFavorite) {
                            guard let index = tracks.firstIndex(where: { $0.id == track.id }) else { return }
                            tracks[index].isLiked = true
                        }
                    }
                    self?.tracks = tracks
                }
            }
        }
    }
    
    
    public func playAudio(fromURL url: URL) {
        player = AVPlayer(url: url)
        if let player = player {
            player.play()
        }
        
    }
    
    
    public func stopAudio() {
        player?.pause()
        player = nil
    }
    
    public func toggleFavourite(_ trackID: Int) {
        if let index = tracks.firstIndex(where: { $0.id == trackID }) {
            
            
            tracks[index].isLiked.toggle() // MUST
            var track = tracks[index]
            track.isLiked = true
            if tracks[index].isLiked == true {
                saveToUserDefaults(track)
                return
            }
            if tracks[index].isLiked == false {
                removeFromUserDefaults(track)
                return
            }
        }
    }
    
    public func toggleIsPlaying(_ trackID: Int) {
        if let index = tracks.firstIndex(where: { $0.id == trackID }) {
            tracks[index].isPlaying.toggle()
        }
    }
    
    public func getFavouriteTracks() {
        if
            let data = defaults.object(forKey: favoriteTracksKey) as? Data,
            let decodedData = try? decoder.decode([TracksDatum].self, from: data)
        {
            favouriteTracks = decodedData
            dump(favouriteTracks.count)
        }
    }
    
    private func saveToUserDefaults(_ track: TracksDatum) {
        getFavouriteTracks()
        favouriteTracks.append(track)
        let encodedTracks = try? encoder.encode(favouriteTracks)
        defaults.set(encodedTracks, forKey: favoriteTracksKey)
    }
    
    public func removeFromUserDefaults(_ track: TracksDatum) {
        getFavouriteTracks()
        guard let index = favouriteTracks.firstIndex(where: { $0.id == track.id }) else { return }
        favouriteTracks[index].isLiked.toggle()
        favouriteTracks.remove(at: index)
        let encodedTracks = try? encoder.encode(favouriteTracks)
        defaults.set(encodedTracks, forKey: favoriteTracksKey)
    }
    
    private func checkIsFavorite(_ track: TracksDatum) -> Bool{
        getFavouriteTracks()
        guard let _ = favouriteTracks.firstIndex(where: { $0.id == track.id }) else { return false }
        return true
    }
}
