//
//  GenreService.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import Alamofire

//MARK: - Protocols

protocol GenreProtocol {
    func getGenre(onSuccess: @escaping (Genre?) -> Void, onError: @escaping (AFError) -> Void)
}

protocol ArtistsProtocol {
    func getArtists(id: Int, onSuccess: @escaping (Artists?) -> Void, onError: @escaping (AFError) -> Void)
}

protocol ArtistDetailProtocol {
    func getArtistDetail(id: Int, onSuccess: @escaping (ArtistDetailResult?) -> Void, onError: @escaping (AFError) -> Void)
}

protocol AlbumProtocol {
    func getAlbum(id: Int, onSuccess: @escaping (AlbumDetail?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Service Class

final class GenreService: GenreProtocol {
    func getGenre(onSuccess: @escaping (Genre?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.deezer.com/genre") { (response: Genre) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}

final class ArtistsService: ArtistsProtocol {
    func getArtists(id: Int, onSuccess: @escaping (Artists?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.deezer.com/genre/\(id)/artists") { (response: Artists) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}

final class ArtistDetailService: ArtistDetailProtocol {
    func getArtistDetail(id: Int, onSuccess: @escaping (ArtistDetailResult?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.deezer.com/artist/\(id)") { (response: ArtistDetailResult) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}

final class AlbumService: AlbumProtocol {
    func getAlbum(id: Int, onSuccess: @escaping (AlbumDetail?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.deezer.com/artist/\(id)/top?limit=50") { (response: AlbumDetail) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}
