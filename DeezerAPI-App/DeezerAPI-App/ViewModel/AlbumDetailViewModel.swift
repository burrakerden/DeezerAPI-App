//
//  AlbumDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 9.06.2023.
//

import Foundation

struct AlbumDetailViewModel {
    
    var isLiked = false
    
    let tracksResult: TracksResult
    
    let songNames: [String]
    
    var songName: String { return tracksResult.title ?? ""}
    
    var duration: Int { return tracksResult.duration ?? 00}
    
    var preview: String { return tracksResult.preview ?? ""}
    
    var image: String?
    
    var buttonImage: String { boolTest ? "heart.fill" : "heart"}
    
    var boolTest: Bool { return songNames.contains(songName) ? true : false}
    
}
