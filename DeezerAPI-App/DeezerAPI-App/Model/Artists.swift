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
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type: TypeEnumm?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type
    }
}

enum TypeEnumm: String, Codable {
    case artist = "artist"
}
