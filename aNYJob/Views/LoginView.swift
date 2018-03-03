//
//  LoginView.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var loginImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BlackPanther")
        iv.layer.borderWidth = CGFloat(Stylesheet.BorderWidths.FunctionButtons)
        Stylesheet.Objects.ImageViews.Opaque.style(imageView: iv)
        return iv
    }()
    
    lazy var titleLabel: UILabel = {
        let stl = UILabel()
        stl.text = "Wakanda Hyper Information Program"
        Stylesheet.Objects.Labels.AppName.style(label: stl)
        stl.backgroundColor = UIColor(white: 1, alpha: 0.03)
        stl.alpha = 0 // for animation
        
        return stl
    }()
    
    lazy var facebookSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle("FaceBook (Coming Soon)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.263, green: 0.353, blue: 0.576, alpha: 1.00)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var twitterSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Twitter (Coming Soon)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.325, green: 0.690, blue: 0.875, alpha: 1.00)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.shadowColor = UIColor.gray.cgColor
        textfield.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfield.layer.shadowOpacity = 1.0
        textfield.layer.shadowRadius = 0.0
        textfield.backgroundColor = Stylesheet.Colors.White
        textfield.textAlignment = NSTextAlignment.center
        textfield.font = Stylesheet.Fonts.TextfieldFont
        textfield.textColor = Stylesheet.Colors.Dark
        textfield.adjustsFontSizeToFitWidth = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .default
        textfield.placeholder = " Email Address"
        textfield.alpha = 0 // for animation
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.shadowColor = UIColor.gray.cgColor
        textfield.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfield.layer.shadowOpacity = 1.0
        textfield.layer.shadowRadius = 0.0
        textfield.backgroundColor = Stylesheet.Colors.White
        textfield.textAlignment = NSTextAlignment.center
        textfield.font = Stylesheet.Fonts.TextfieldFont
        textfield.textColor = Stylesheet.Colors.Dark
        textfield.adjustsFontSizeToFitWidth = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .asciiCapable
        textfield.returnKeyType = .default
        textfield.placeholder = " Password"
        textfield.isSecureTextEntry = true
        textfield.alpha = 0 // for animation
        return textfield
    }()
    
    lazy var emailIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.image = UIImage(named: "email")
        iv.contentMode = .scaleAspectFit
        iv.layer.shadowColor = UIColor.gray.cgColor
        iv.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        iv.layer.shadowOpacity = 1.0
        iv.layer.shadowRadius = 0.0
        iv.alpha = 0 // for animation
        return iv
    }()
    
    lazy var passwordIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.image = UIImage(named: "lock")
        iv.contentMode = .scaleAspectFit
        iv.layer.shadowColor = UIColor.gray.cgColor
        iv.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        iv.layer.shadowOpacity = 1.0
        iv.layer.shadowRadius = 0.0
        iv.alpha = 0
        iv.alpha = 0 // for animation
        return iv
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.910, green: 0.412, blue: 0.204, alpha: 1.00)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(white: 1, alpha: 0.03)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(white: 1, alpha: 0.03)
        button.alpha = 0 // for animation
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
        setupObjects()
        setupViews()
    }
    
    private func setupObjects() {
        addSubview(loginImageView)
        addSubview(titleLabel)
        addSubview(facebookSignInButton)
        addSubview(twitterSignInButton)
        addSubview(emailIconImageView)
        addSubview(emailTextField)
        addSubview(passwordIconImageView)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(createAccountButton)
        addSubview(forgotPasswordButton)
    }
    
    private func setupViews() {
        loginImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
        }
        
        facebookSignInButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.safeAreaLayoutGuide.snp.centerY).multipliedBy(1.8)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.08)
        }
        
        twitterSignInButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(facebookSignInButton.snp.top).offset(-10)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(facebookSignInButton)
        }
        
        emailIconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(40)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.1)
            make.height.equalTo(emailIconImageView.snp.width)
        }
        
        passwordIconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(emailIconImageView.snp.bottom).offset(5)
            make.leading.equalTo(emailIconImageView)
            make.width.equalTo(emailIconImageView)
            make.height.equalTo(emailIconImageView)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailIconImageView)
            make.leading.equalTo(emailIconImageView.snp.trailing)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-40)
            make.height.equalTo(emailIconImageView)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordIconImageView)
            make.leading.equalTo(passwordIconImageView.snp.trailing)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-40)
            make.height.equalTo(passwordIconImageView)
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordIconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.leading.equalTo(passwordIconImageView.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        createAccountButton.snp.makeConstraints { (make) in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(signInButton.snp.width)
        }
        
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.top.equalTo(createAccountButton.snp.bottom).offset(10)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(signInButton.snp.width)
        }
    
    }
    
}

