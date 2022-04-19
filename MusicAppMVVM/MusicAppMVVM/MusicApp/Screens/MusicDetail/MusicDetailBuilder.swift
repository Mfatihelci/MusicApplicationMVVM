//
//  MusicDetailBuilder.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import Foundation
import Alamofire

final class MusicDetailBuilder {
    static func make(music: MusicDetailPresentation) -> MusicDetailViewController {
        let vc = MusicDetailViewController()
        let viewModel = MusicDetailViewModel(view: vc, music: music)
        vc.viewModel = viewModel
        return vc
    }
}
