//
//  CreateAccountVC.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateAccountVC: UIViewController {
    
    let createAccountView = CreateAccountView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupViews()
    }
    private func setupViews() {
        self.view.addSubview(createAccountView)
        createAccountView.emailTextField.delegate = self
        createAccountView.addressTextField.delegate = self
        createAccountView.passwordTextField.delegate = self
        
        //Action for Create Account Button
        createAccountView.createAccountButton.addTarget(self, action: #selector(newAccountFunc), for: .touchUpInside)
        createAccountView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func newAccountFunc() {
        if currentReachabilityStatus == .notReachable {
            let noInternetAlert = Alert.createErrorAlert(withMessage: "No Internet Connectivity. Please check your network and restart the app.")
            self.present(noInternetAlert, animated: true, completion: nil)
            return
        }
        
        guard let addressText = createAccountView.addressTextField.text else {
            createAccountView.statusLabel.text = "Optional - Please enter a valid address"
            return
        }
        guard let passwordText = createAccountView.passwordTextField.text else {
            createAccountView.statusLabel.text = "Please enter a valid Password"
            return
        }
        guard let emailText = createAccountView.emailTextField.text else {
            createAccountView.statusLabel.text = "Please enter a valid Email"
            return
        }
        
        AuthUserService.manager.delegate = self
        AuthUserService.manager.createAccount(withEmail: emailText, password: passwordText, address: addressText) {
            let alert = Alert.create(withTitle: "Error", andMessage: "This display name has already been used.", withPreferredStyle: .alert)
            Alert.addAction(withTitle: "OK", style: .default, andHandler: nil, to: alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension CreateAccountVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func presentErrorAlert(withErrorMessage message: String) {
        let alertController = Alert.createErrorAlert(withMessage: message)
        self.present(alertController, animated: true, completion: nil)
    }
}
extension CreateAccountVC: AuthUserServiceDelegate {
    func didFailCreatingUser(_ authUserService: AuthUserService, error: String) {
        presentErrorAlert(withErrorMessage: error)
    }
    func didFailEmailVerification(_ authUserService: AuthUserService, user: User, error: String) {
        presentErrorAlert(withErrorMessage: error)
    }
    func didCreateUser(_ authUserService: AuthUserService, userProfile: UserProfile) {
        let alert = Alert.create(withTitle: "Success!", andMessage: "Account Created\nA verification email has been sent to your email, \(self.createAccountView.emailTextField.text!) ", withPreferredStyle: .alert)
        Alert.addAction(withTitle: "Back to Login", style: .default, andHandler: { (_) in
            self.dismiss(animated: true, completion: {
                self.createAccountView.emailTextField.text = nil
                self.createAccountView.passwordTextField.text = nil
                self.createAccountView.addressTextField.text = nil
            })
        }, to: alert)
        present(alert, animated: true, completion: nil)
    }
}

