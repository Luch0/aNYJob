//
//  ComparisonView.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class ComparisonView: UIView {

    // For the container view, just add all the objects from the jobDetailTableViewCell and contrain them to inside the container view.
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.969, alpha: 1.00)
        return view
    }()
    
    lazy var comparisonTableView: UITableView = {
        let tv = UITableView()
        //create and register a cell
        tv.register(ComparisonTableViewCell.self, forCellReuseIdentifier: "ComparisonCell")
        tv.backgroundColor = .clear
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
        addSubview(containerView)
        addSubview(comparisonTableView)
        
        containerView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.2)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
        }
        comparisonTableView.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.bottom)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
