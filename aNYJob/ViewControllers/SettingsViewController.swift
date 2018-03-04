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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func addAddress() {
        print("Clicked on add address")
        let alertController = UIAlertController(title: "Add Address", message: "Enter your address", preferredStyle: .alert)
        alertController.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { alert in
            let userTexInput = alertController.textFields![0].text!
            guard !userTexInput.isEmpty else {
                self.showAlert(title: "Error", message: "Must enter a valid address")
                return
            }
            // TODO: add address user defaults
            UserDefaultsHelper.manager.saveAddress(named: userTexInput)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {alert in
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func logout() {
        print("Clicked on logout")
        print(UserDefaultsHelper.manager.getAddress()!)
    }
    
}
