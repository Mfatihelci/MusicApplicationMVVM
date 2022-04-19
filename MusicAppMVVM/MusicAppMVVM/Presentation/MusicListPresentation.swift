//
//  MusicListPresentation.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation

public struct MusicPresentation {
    let name:String
    let image:String
    let ArtistName:String
    
    init(name:String,image:String,ArtistName:String){
        self.name = name
        self.image = image
        self.ArtistName = ArtistName
    }
}
