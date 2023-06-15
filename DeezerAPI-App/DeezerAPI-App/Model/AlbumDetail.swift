//
//  AlbumDetail.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation

// MARK: - AlbumDetail
struct AlbumDetail: Codable {
    let tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case tracks
    }
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksResult]?
}

// MARK: - TracksResult
struct TracksResult: Codable {
    let id: Int?
    let title: String?
    let duration: Int?
    let preview: String?
}


