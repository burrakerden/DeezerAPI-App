//
//  Artists.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

// MARK: - Artists
struct Artists: Codable {
    let data: [ArtistsResult]?
}

// MARK: - ArtistsResult
struct ArtistsResult: Codable {
    let id: Int?
    let name: String?
    let pictureMedium: String?
    let pictureBig: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
    }
}


