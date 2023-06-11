//
//  Genre.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let data: [GenreResult]?
}

// MARK: - Result
struct GenreResult: Codable {
    let id: Int?
    let name: String?
    let pictureXl: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pictureXl = "picture_xl"
    }
}
