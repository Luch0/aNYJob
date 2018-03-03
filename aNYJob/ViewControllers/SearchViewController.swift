//
//  SearchViewController.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchView()
    }
    
    private func configureSearchView() {
        view.addSubview(searchView)
        searchView.tableView.dataSource = self
        searchView.tableView.delegate = self
        searchView.boroughSegmentedControl.addTarget(self, action: #selector(boroughSegmentedControlValueChanged), for: .valueChanged)
        searchView.jobTypeSegmentedControl.addTarget(self, action: #selector(jobTypeSegmentedControlValueChanged), for: .valueChanged)
    }
    
    @objc private func boroughSegmentedControlValueChanged() {
        // 0 All
        // 1 Queens
        // 2 Manhattan
        // 3 Brooklyn
        // 4 Bronx
        // 5 Manhattan
    }
    
    @objc private func jobTypeSegmentedControlValueChanged() {
        // 0 All
        // 1 Fulltime
        // 2 Parttime
        // 3 Intern
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

