//
//  MusicDetailViewController.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MusicDetailViewController: UIViewController {
      
    private let ımage: UIImageView = UIImageView()
    private let artist: UILabel = UILabel()
    private let artistName: UILabel = UILabel()
    private let Genre: UILabel = UILabel()
    private let button: UIButton = UIButton()
    private var url: String = ""
    
    var viewModel: MusicDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        configure()
        drawDesing()
        clickButton()
    }
    
    private func configure(){
        view.addSubview(ımage)
        view.addSubview(artist)
        view.addSubview(artistName)
        view.addSubview(Genre)
        view.addSubview(button)
        makeImage()
        makeArtist()
        makeArtistName()
        makegenre()
        makeButton()
    }
    
    private func drawDesing(){
        view.backgroundColor = .white
        artist.font = .boldSystemFont(ofSize: 20)
        artistName.font = .boldSystemFont(ofSize: 20)
        Genre.font = .boldSystemFont(ofSize: 20)
        self.title = "Detail"
        button.setTitle("ITunes", for: .normal)
        button.setTitleColor(UIColor.black , for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        button.layer.cornerCurve = .continuous
        button.clipsToBounds = true
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 10
    }
    
    func clickButton(){
        button.addTarget(self, action: #selector(clickUrl), for: .touchUpInside)
    }
    
     @objc func clickUrl(){
        if let url = URL(string: "\(url)") {
             UIApplication.shared.open(url, options: [:])
         }
    }
}

extension MusicDetailViewController: MusicDetailViewModelDelegate {
    func update(_ value: MusicDetailPresentation) {
        artist.text = value.name
        artistName.text = value.ArtistName
        Genre.text = value.genre
        ımage.af.setImage(withURL: URL(string: value.image)!)
        url = value.artistUrl
    }
}

extension MusicDetailViewController {
    private func makeImage(){
        ımage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }
    
    private func makeArtist(){
        artist.snp.makeConstraints { make in
            make.top.equalTo(ımage.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeArtistName(){
        artistName.snp.makeConstraints { make in
            make.top.equalTo(artist.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makegenre(){
        Genre.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeButton(){
        button.snp.makeConstraints { make in
            make.top.equalTo(Genre.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
        }
    }
}
