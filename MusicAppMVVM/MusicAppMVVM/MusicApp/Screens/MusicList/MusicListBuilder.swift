//
//  MusicListBuilder.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation
import Alamofire

final class MusicListBuilder {
    static func make() -> MusicListViewController {
        let view = MusicListViewController()
        view.viewModel = MusicListViewModel(service: MusicService())
        return view
    }
}
