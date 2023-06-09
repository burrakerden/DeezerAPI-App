//
//  ArtistHeaderViewModel.swift
//  DeezerAPI-App
//
//  Created by Burak Erden on 8.06.2023.
//

import Foundation
import UIKit

struct ArtistHeaderViewModel {
    
    var name: String
    
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
