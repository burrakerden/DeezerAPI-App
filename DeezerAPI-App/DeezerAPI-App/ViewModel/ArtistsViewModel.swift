//
//  ArtistViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

struct ArtistsViewModel {
    
    var result: ArtistsResult
    
    var id: Int { return result.id ?? 0}
    
    var name: String { return result.name ?? "invalid name" }
    
    var imageUrl: URL? { return URL(string: result.pictureMedium ?? "") }

}
