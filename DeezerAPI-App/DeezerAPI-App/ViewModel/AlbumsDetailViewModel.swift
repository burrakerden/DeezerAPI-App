//
//  AlbumDetailViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 7.06.2023.
//

import Foundation

struct AlbumsDetailViewModel {
    
    var dic: [String: MutipleValue]

    var albumName: String { return dic.first?.key ?? ""}
    
    var imageUrl: String { return dic[albumName]?.image ?? ""}

    init(dic: [String : MutipleValue]) {
        self.dic = dic
    }
}
