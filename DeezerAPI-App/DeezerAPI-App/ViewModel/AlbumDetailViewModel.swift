//
//  AlbumDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

struct AlbumDetailViewModel {
    
    var result: Album
    
    
    var name: String { return result.title ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.coverBig ?? "") }

    
    init(result: Album) {
        self.result = result
    }
}
