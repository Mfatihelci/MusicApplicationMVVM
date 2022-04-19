//
//  MusicDetailViewModel.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import Foundation
import Alamofire

final class MusicDetailViewModel: MusicDetailViewModelProtocol {
      
    var view: MusicDetailViewModelDelegate?
    var music: MusicDetailPresentation?
    
    init(view: MusicDetailViewModelDelegate,music: MusicDetailPresentation){
        self.music = music
        self.view = view
    }
    
    func load() {
        view?.update(music!)
    }
}
