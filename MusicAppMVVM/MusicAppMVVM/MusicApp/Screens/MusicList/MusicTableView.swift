//
//  MusicTableView.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import Alamofire
import UIKit

final class TableViewProvider: NSObject {
    
    private var musicL: [MusicPresentation] = []
    private var detail: [Result] = []
    var delegate: tableViewProviderDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musicL[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicListTableViewCell.Identifier.ID.rawValue) as? MusicListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.saveModel(data: music)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = detail[indexPath.row]
        let dataTwo = MusicDetailPresentation.init(musicDeteil: data)
        delegate?.onSelected(value: dataTwo)
    }
}

extension TableViewProvider: UITableViewDelegate,UITableViewDataSource { }

extension TableViewProvider: tableViewProviderProtocol {
    func update(value: [Result]) {
        self.detail = value
        let data = value.map(MusicPresentation.init)
        musicL = data
    }
}
