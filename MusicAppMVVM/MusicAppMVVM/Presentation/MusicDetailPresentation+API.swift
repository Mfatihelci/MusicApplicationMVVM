//
//  MusicDetailPresentation+API.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import Foundation

extension MusicDetailPresentation {
    init(musicDeteil: Result){
        self.init(name: musicDeteil.name,
                  image: musicDeteil.artworkUrl100,
                  ArtistName: musicDeteil.artistName,
                  genre: musicDeteil.genres.map({$0.name.rawValue}).joined(),
                  artistUrl: musicDeteil.url
    )}
}
