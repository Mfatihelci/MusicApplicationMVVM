//
//  Splash.swift
//  MusicAppMVVM
//
//  Created by fatih on 14.04.2022.
//

import UIKit
import SnapKit
import Alamofire

class Connect {
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class SplashVC: UIViewController {

    private var nameLabel = UILabel()
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private var musicIcon: UIImageView = UIImageView()
    private var name: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        drawDesing()
        animation()
    }
    
    private func animation() {
        UIView.animate(withDuration: 2, animations: {
            self.indicator.startAnimating()
            self.musicIcon.alpha = 3},
            completion: { _ in
            self.isNetwork()
        })
    }

    private func isNetwork() {
        if Connect.isConnected() {
            let viewController = MusicListBuilder.make()
            viewController.modalPresentationStyle = .fullScreen
            self.show(viewController, sender: nil)
        }else{
            print("error")
        }
    }

    private func configure() {
        view.addSubview(indicator)
        view.addSubview(nameLabel)
        view.addSubview(musicIcon)
        view.addSubview(name)
        view.backgroundColor = .black
        makeLabel()
        makeIndicator()
        makeMusicIcon()
        makeName()
    }
    
    private func drawDesing(){
        nameLabel.text = "Music Application"
        nameLabel.textColor = .white
        name.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 28)
        name.text = "Muhammed Fatih Elçi"
        name.font = .boldSystemFont(ofSize: 20)
        indicator.color = .yellow
        musicIcon.image = UIImage(named: "music")
    }
}

extension SplashVC {
    private func makeMusicIcon() {
         musicIcon.snp.makeConstraints { make in
             make.centerX.equalTo(view.snp.centerX)
             make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
             make.height.width.equalTo(80)
         }
     }
    
   private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.top.equalTo(musicIcon.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(25)
        }
    }
    
    private func makeLabel() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(indicator.snp.bottom).offset(25)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeName() {
        name.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
