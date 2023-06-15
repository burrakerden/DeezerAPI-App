//
//  ArtistDetail.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

import Foundation

// MARK: - ArtistDetailResult
struct ArtistDetailResult: Codable {
    let id: Int?
    let name: String?
    let pictureBig: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pictureBig = "picture_big"
    }
}
