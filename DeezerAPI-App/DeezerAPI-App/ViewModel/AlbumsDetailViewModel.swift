//
//  AlbumDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

struct AlbumsDetailViewModel {
    
    let result: AlbumsDetailResult
    
    var albumName: String { return result.title ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.coverBig ?? "") }
    
    var date: String { return result.releaseDate?.chanceDate() ?? ""}
    
}
