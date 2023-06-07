//
//  GenreViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 6.06.2023.
//

import Foundation

struct GenreViewModel {
    
    var result: Result
    
    var name: String { return result.name ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.pictureXl ?? "") }

    
    init(result: Result) {
        self.result = result
    }
}
