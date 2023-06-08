//
//  GenreViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import Foundation

struct GenreViewModel {
    
    var result: GenreResult
    
    var id: Int { return result.id ?? 0}
    
    var name: String { return result.name ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.pictureXl ?? "") }

    
    init(result: GenreResult) {
        self.result = result
    }
}
