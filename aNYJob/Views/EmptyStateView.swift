//
//  EmptyStateView.swift
//  AC-iOS-Final
//
//  Created by Richard Crichlow on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SnapKit

class EmptyStateView: UIView {

    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        Stylesheet.Objects.Labels.Regular.style(label: label)
        label.font = UIFont(name: "Helvetica Neue", size: 20.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "logo2Trans")
        return imageView
    }()
    
    init(emptyText: String) {
        super.init(frame: UIScreen.main.bounds)
        self.emptyLabel.text = emptyText
        commonInit()
    }
    
    init(frame: CGRect, emptyText: String) {
        super.init(frame: frame)
        self.emptyLabel.text = emptyText
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

}

extension EmptyStateView {
    private func setupViews() {
        setupLogoImageView()
        setupEmptyLabel()
    }
    
    private func setupLogoImageView() {
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY).offset(-25)
            make.width.equalTo(snp.width).multipliedBy(0.50)
            make.height.equalTo(logoImageView.snp.width)
        }
    }
    
    private func setupEmptyLabel() {
        addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(logoImageView.snp.bottom)
            make.leading.equalTo(logoImageView.snp.leading)
            make.trailing.equalTo(logoImageView.snp.trailing)
        }
    }
    
}
