//
//  SettingsViewController.swift
//  aNYJob
//
//  Created by Luis Calle on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        configureNavBar()
        addButtonActions()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Settings"
    }
    
    private func addButtonActions() {
        settingsView.addAddressButton.addTarget(self, action: #selector(addAddress), for: .touchUpInside)
        settingsView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    @objc private func addAddress() {
        print("Clicked on add address")
    }
    
    @objc private func logout() {
        print("Clicked on logout")
    }
    
}
