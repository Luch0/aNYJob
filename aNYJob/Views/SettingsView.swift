//
//  SettingsView.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyButton

class SettingsView: UIView {
    
    let buttonColor = UIColor(red: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)
    let shadowColor = UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)
    
//    lazy public var addAddressButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Add Address", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        return button
//    }()
    
    lazy public var addAddressButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Add Address", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
        return button
    }()
    
//    lazy public var logoutButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Logout", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        return button
//    }()
    
    
    lazy public var logoutButton: PressableButton = {
        let button = PressableButton()
        button.setTitle("Logout", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.colors = .init(button: buttonColor, shadow: shadowColor)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupAddAddressButton()
        setupLogoutButton()
    }
    
    private func setupAddAddressButton() {
        addSubview(addAddressButton)
        addAddressButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.07)
        }
    }
    
    private func setupLogoutButton() {
        addSubview(logoutButton)
        logoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(addAddressButton.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(addAddressButton.snp.height)
        }
    }

}
