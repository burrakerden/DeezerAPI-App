//
//  AlbumDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation

struct AlbumDetailViewModel {
    
    let tracksResult: TracksResult
    
    var songName: String { return tracksResult.title ?? ""}
    
    var duration: Int { return tracksResult.duration ?? 00}
    
    var image: String?
    
}
