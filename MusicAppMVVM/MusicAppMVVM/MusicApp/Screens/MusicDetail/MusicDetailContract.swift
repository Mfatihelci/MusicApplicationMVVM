//
//  MusicDetailContract.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import Foundation

protocol MusicDetailViewModelProtocol {
    func load()
}

protocol MusicDetailViewModelDelegate {
    func update(_ value: MusicDetailPresentation )
}
