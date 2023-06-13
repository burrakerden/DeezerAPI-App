//
//  LikesViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 12.06.2023.
//

import Foundation


struct LikesViewModel {
    
    var isLiked: Bool
    var songDuration: Int64
    var songImage: String
    var songName: String
    var songPreview: String
    
    init(isLiked: Bool, songDuration: Int64, songImage: String, songName: String, songPreview: String) {
        self.isLiked = isLiked
        self.songDuration = songDuration
        self.songImage = songImage
        self.songName = songName
        self.songPreview = songPreview
    }

}



