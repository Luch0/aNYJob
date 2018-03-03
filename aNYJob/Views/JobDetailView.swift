//
//  JobDetailView.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class JobDetailView: UIView {

    lazy public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(JobDetailTableViewCell.self, forCellReuseIdentifier: "detailCell")
        return tableView
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
    
}

extension JobDetailView {
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }
}
