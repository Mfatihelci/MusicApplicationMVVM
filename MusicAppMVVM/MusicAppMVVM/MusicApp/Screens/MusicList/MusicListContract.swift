//
//  MusicListContract.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation

protocol MusicListViewModelProtocol {
    var delegate: MusicListViewModelDelegate? { get set }
    func load()
}

enum MusicListViewModelOutPut {
    case updateTitle(String)
    case showMusicList([Result])
}

protocol MusicListViewModelDelegate {
    func handleViewModelOutPut(_ output: MusicListViewModelOutPut)
}

//MARK: - TableViewProvider

protocol tableViewProviderProtocol {
    func update(value: [Result])
}

protocol tableViewProviderDelegate {
    func onSelected(value: MusicDetailPresentation)
}

