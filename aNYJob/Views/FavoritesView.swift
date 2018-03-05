//
//  FavoritesView.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class FavoritesView: UIView {

    lazy var jobTableView: UITableView = {
        let tv = UITableView()
        //create and register a cell
        tv.register(JobTableViewCell.self, forCellReuseIdentifier: "JobCell")
        tv.backgroundColor = UIColor(red: 0.933, green: 0.494, blue: 0.212, alpha: 1.00)
        tv.separatorColor = .clear
        return tv
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
        addSubview(jobTableView)
        
        jobTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
        }
    }

}
