//
//  JobDetailTableViewCell.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class JobDetailTableViewCell: UITableViewCell {

    // Title
    // Department/ Field
    // Blurb
    
    // Apply Here

    // Location
    //
    // Map View
    //
    //
    //
    
    // Additional Info
    
    // Buttons
    
    lazy public var titleLabel: UILabel = {
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

extension JobDetailTableViewCell {
    private func setupViews() {
        
    }
}
