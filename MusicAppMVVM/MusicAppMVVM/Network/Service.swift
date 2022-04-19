//
//  Service.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Foundation
import Alamofire

protocol MusicServiceProtocol {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

public enum MusicServiceEntPoint: String {
    case path_url = "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/50/songs.json"
}

public class MusicService: MusicServiceProtocol {
    public init() { }
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(MusicServiceEntPoint.path_url.rawValue).responseDecodable(of: Welcome.self){ (model) in
            guard let data = model.value else { return }
            //guard let value = data.feed.results else  { return }
            let value = data.feed.results
            response(value)
        }
    }
}
