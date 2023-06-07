//
//  GenreService.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import Alamofire

//MARK: - Protocols

protocol ServiceProtocol {
    func getGenre(onSuccess: @escaping (Genre?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Service Class

final class GenreService: ServiceProtocol {
    func getGenre(onSuccess: @escaping (Genre?) -> Void, onError: @escaping (Alamofire.AFError) -> Void) {
        ServiceManager.shared.fetch(path: "https://api.deezer.com/genre") { (response: Genre) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
}
