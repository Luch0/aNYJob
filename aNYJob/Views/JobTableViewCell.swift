//
//  JobTableViewCell.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    lazy public var jobTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy public var salaryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

extension JobTableViewCell {
    private func setupViews() {
        
    }
    
    
}
