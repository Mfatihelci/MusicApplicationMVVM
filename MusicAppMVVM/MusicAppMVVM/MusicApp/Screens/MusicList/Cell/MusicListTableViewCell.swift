//
//  MusicListTableViewCell.swift
//  MusicAppMVVM
//
//  Created by fatih on 13.04.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MusicListTableViewCell: UITableViewCell {
    
    private let kapak: UIImageView = UIImageView()
    private let artistName: UILabel = UILabel()
    private let name: UILabel = UILabel()
    private let star: UIImageView = UIImageView()
    private let number: UILabel = UILabel()
      
    enum Identifier: String {
        case ID = "Cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        drawDesing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(kapak)
        addSubview(artistName)
        addSubview(name)
        addSubview(star)
        addSubview(number)
        makeKapak()
        makeArtistName()
        makeName()
        makeStar()
        makeNumber()
    }
    
    private func drawDesing(){
        name.textColor = .black
        artistName.textColor = .black
        name.font = .boldSystemFont(ofSize: 20)
        artistName.font = .boldSystemFont(ofSize: 20)
        star.image = UIImage(named: "star")
        
    }
    
    func saveModel(data: MusicPresentation) {
        name.text = data.name
        artistName.text = data.ArtistName
        kapak.af.setImage(withURL: URL(string: data.image)!)

    }
}

extension MusicListTableViewCell {
    private func makeKapak(){
        kapak.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(120)
            make.width.equalTo(140)
        }
    }
    
    private func makeArtistName(){
        artistName.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(kapak.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    
    private func makeName(){
        name.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(10)
            make.left.equalTo(kapak.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    
    private func makeStar(){
        star.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(kapak.snp.right).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    private func makeNumber(){
        number.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(star.snp.right).offset(10)
        }
    }
}



