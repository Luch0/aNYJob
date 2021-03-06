//
//  CreateAccountView.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class CreateAccountView: UIView {
    
    // Create Account Label
    lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Join Us!"
        Stylesheet.Objects.Labels.AppName.style(label: label)
        return label
    }()
    
    //address textfield
    lazy var addressTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.Address.style(textfield: tField)
        return tField
    }()
    
    //password textfield
    lazy var passwordTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.LoginPassword.style(textfield: tField)
        return tField
    }()
    
    //email textfield
    lazy var emailTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.LoginEmail.style(textfield: tField)
        return tField
    }()
    
    //status label, ex: success/fail to login
    lazy var statusLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Status: "
        lb.backgroundColor = .gray
        lb.textAlignment = .center
        lb.backgroundColor = .white
        lb.textColor = .red
        return lb
    }()
    
    //create account button
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        Stylesheet.Objects.Buttons.CreateButton.style(button: button)
        return button
    }()
    
    //cancel button
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        Stylesheet.Objects.Buttons.ClearButton.style(button: button)
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
        backgroundColor = UIColor(red: 0.267, green: 0.612, blue: 0.843, alpha: 1.00)
        setupObjects()
        setupViews()
    }
    
    private func setupObjects() {
        self.addSubview(createAccountLabel)
        self.addSubview(addressTextField)
        self.addSubview(passwordTextField)
        self.addSubview(emailTextField)
        self.addSubview(statusLabel)
        self.addSubview(createAccountButton)
        self.addSubview(cancelButton)
    }
    
    private func setupViews() {
        
        createAccountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.createAccountLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
        }
        
        addressTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
        }
        
        createAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(addressTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.ButtonWidthMult)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(Stylesheet.ConstraintSizes.ButtonHeightMult)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountButton.snp.bottom).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.ButtonWidthMult)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(Stylesheet.ConstraintSizes.ButtonHeightMult)
        }
        
        
    }
}

