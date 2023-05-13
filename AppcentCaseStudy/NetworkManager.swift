//
//  DataManager.swift
//  DeezerClone
//
//  Created by Onur Ural on 9.05.2023.
//

import Foundation

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    let baseUrl = URL(string: "https://api.deezer.com")!
        
    func fetchGenres(completion: @escaping ([Genre]?, Error?) -> Void) {
        let endpoint = baseUrl.appendingPathComponent("/genre")
        
        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            
        if let error = error {
            completion(nil, error)
            return
        }
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NSError(domain: "HttpError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        guard let data = data else {
            completion(nil, NSError(domain: "DataError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        do {
            let genres = try JSONDecoder().decode(GenreResponse.self, from: data)
                completion(genres.data, nil)
            } catch {
                completion(nil, error)
            }
                
        }
        task.resume()
        }
    
    func fetchArtists(genreId: Int, completion: @escaping ([Artist]?, Error?) -> Void) -> Void {
        let endpoint = baseUrl.appendingPathComponent("/genre/\(genreId)/artists")
        
        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            
        if let error = error {
            completion(nil, error)
            return
        }
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NSError(domain: "HttpError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        guard let data = data else {
            completion(nil, NSError(domain: "DataError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        do {
            let artists = try JSONDecoder().decode(ArtistResponse.self, from: data)
                completion(artists.data, nil)
            } catch {
                completion(nil, error)
            }
                
        }
        task.resume()
    }
    
    func fetchArtistDetails(artistId: Int, completion: @escaping (ArtistDetail?, Error?) -> Void) -> Void {
        let endpoint = baseUrl.appendingPathComponent("/artist/\(artistId)/")
        
        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            
        if let error = error {
            completion(nil, error)
            return
        }
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NSError(domain: "HttpError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        guard let data = data else {
            completion(nil, NSError(domain: "DataError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        do {
            let artist = try JSONDecoder().decode(ArtistDetail.self, from: data)
                completion(artist, nil)
            } catch {
                completion(nil, error)
            }
                
        }
        task.resume()
    }
    
    func fetchTopTracks(trackListURL: String, completion: @escaping ([Track]?, Error?) -> Void) -> Void {
        let endpoint = trackListURL.replacingOccurrences(of: "\\/", with: "/")
        let url = URL(string: endpoint)!
//        print("TOP TRACKS ENDPONT: \(endpoint)")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
        if let error = error {
            completion(nil, error)
            return
        }
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NSError(domain: "HttpError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        guard let data = data else {
            completion(nil, NSError(domain: "DataError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        do {
            let tracks = try JSONDecoder().decode(TopTracks.self, from: data)
                completion(tracks.data, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func fetchAlbumDetail(albumId id: Int, completion: @escaping (ArtistAlbum?, Error?) -> Void) -> Void {
        let endpoint = baseUrl.appendingPathComponent("/album/\(id)/")
        
        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
            
        if let error = error {
            completion(nil, error)
            return
        }
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NSError(domain: "HttpError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        guard let data = data else {
            completion(nil, NSError(domain: "DataError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
            return
        }
                
        do {
            let album = try JSONDecoder().decode(ArtistAlbum.self, from: data)
                completion(album, nil)
            } catch {
                completion(nil, error)
            }
                
        }
        task.resume()
    }
}
