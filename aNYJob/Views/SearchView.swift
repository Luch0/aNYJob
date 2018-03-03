//
//  SearchView.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    lazy public var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = .white
        return searchBar
    }()
    
    lazy public var boroughSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "All", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Queens", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Manhattan", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Brooklyn", at: 3, animated: true)
        segmentedControl.insertSegment(withTitle: "Bronx", at: 4, animated: true)
        segmentedControl.insertSegment(withTitle: "Staten Island", at: 5, animated: true)
        return segmentedControl
    }()
    
    lazy public var jobTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "All", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Full-Time", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Part-Time", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Intern", at: 3, animated: true)
        return segmentedControl
    }()
    
    lazy public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "jobCell")
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

extension SearchView {
    private func setupViews() {
        setupSearchBar()
        setupBoroughSegmentedControl()
        setupJobTypeSegmentedControl()
        setupTableView()
    }
    
    private func setupSearchBar() {
        addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    private func setupBoroughSegmentedControl() {
        addSubview(boroughSegmentedControl)
        boroughSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    private func setupJobTypeSegmentedControl() {
        addSubview(jobTypeSegmentedControl)
        jobTypeSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(boroughSegmentedControl.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(jobTypeSegmentedControl.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
