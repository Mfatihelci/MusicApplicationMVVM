//
//  MusicListViewModel.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation
import Alamofire

final class MusicListViewModel: MusicListViewModelProtocol {
    
    var musicList: [Result] = []
    var delegate: MusicListViewModelDelegate?
    private let service: MusicServiceProtocol?
    
    init(service: MusicServiceProtocol){
        self.service = service
    }
    
    func load() {
        delegate?.handleViewModelOutPut(.updateTitle(""))
        service?.fetchAllDatas (response: { [delegate](result) in
            guard let data = result else { return }
            delegate?.handleViewModelOutPut(.showMusicList(data))
            self.musicList = data
        }
    )}
}
