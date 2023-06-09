//
//  ArtistDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

struct ArtistDetailViewModel {
    
    var result: ArtistDetailResult
    
    var name: String { return result.name ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.pictureBig ?? "") }

    
    init(result: ArtistDetailResult) {
        self.result = result
    }
}
