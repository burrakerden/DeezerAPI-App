//
//  Album.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct AlbumsDetail: Codable {
    let data: [AlbumsDetailResult]?
}

// MARK: - Datum
struct AlbumsDetailResult: Codable {
    let id: Int?
    let title: String?
    let coverBig: String?
    let releaseDate: String?
 
    enum CodingKeys: String, CodingKey {
        case id, title
        case coverBig = "cover_big"
        case releaseDate = "release_date"
    }
}
