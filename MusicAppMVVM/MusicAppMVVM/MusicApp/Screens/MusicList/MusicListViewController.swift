//
//  MusicListViewController.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import UIKit
import SnapKit

class MusicListViewController: UIViewController, tableViewProviderDelegate {
   
    private let TableViewMusic: UITableView = UITableView()
    private let titlee: UILabel = UILabel()
    private let icon: UIImageView = UIImageView()
    private let tableView: TableViewProvider = TableViewProvider()
    
    var viewModel: MusicListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        tableView.delegate = self
        
        viewModel.load()
        
        initDelegate()
        
        initService()
    }
    
    private func initDelegate(){
        TableViewMusic.register(MusicListTableViewCell.self, forCellReuseIdentifier: MusicListTableViewCell.Identifier.ID.rawValue)
        TableViewMusic.delegate = tableView
        TableViewMusic.dataSource = tableView
    }
    
    private func initService(){
        configure()
        drawDesing()
    }
    
    private func configure(){
        view.addSubview(TableViewMusic)
        view.addSubview(titlee)
        view.addSubview(icon)
        makeTitle()
        makeIcon()
        makeTableViewMusic()
    }
    
    private func drawDesing(){
        TableViewMusic.rowHeight = 150
        view.backgroundColor = .yellow
        titlee.text = "Top 50 Music"
        titlee.textColor = .black
        titlee.font = .boldSystemFont(ofSize: 18)
        icon.image = UIImage(named: "logo")
        TableViewMusic.backgroundColor = .white
    }
    
    func onSelected(value: MusicDetailPresentation) {
        let viewController = MusicDetailBuilder.make(music: value)
        show(viewController, sender: nil)
    }
}

extension MusicListViewController: MusicListViewModelDelegate {
    func handleViewModelOutPut(_ output: MusicListViewModelOutPut) {
        switch output{
        case .updateTitle(let title):
            self.title = title
        case .showMusicList(let list):
            tableView.update(value: list)
            TableViewMusic.reloadData()
        }
    }
}

extension MusicListViewController {
    private func makeTitle(){
            titlee.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view).offset(20)
        }
    }
    
    private func makeIcon(){
            icon.snp.makeConstraints { make in
            make.bottom.equalTo(titlee)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeTableViewMusic(){
        TableViewMusic.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(5)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}

