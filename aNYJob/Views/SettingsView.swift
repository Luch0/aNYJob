//
//  SettingsView.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    
    lazy public var addAddressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Address", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy public var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
        }
    }
    
    private func setupLogoutButton() {
        addSubview(logoutButton)
        logoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(addAddressButton.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }

}
