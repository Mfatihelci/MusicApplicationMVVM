//
//  MusicListPresentation+API.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation

extension MusicPresentation {
    init(musicData: Result){
        self.init(name: musicData.name,
                  image: musicData.artworkUrl100,
                  ArtistName: musicData.artistName)
    }
}
