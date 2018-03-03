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
    
    var jobs = [Job]() {
        didSet {
            searchView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureSearchView()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Search"
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
        // 5 SI
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableViewCell
        let job = Job(additional_information: "das", agency: "asdsa", business_title: "asdsa", civil_service_title: "asdsa", division_work_unit: "adsd", full_time_part_time_indicator: "ads", hours_shift: "dasda", job_category: "asdsa", job_description: "Asdas", job_id: "ads", minimum_qual_requirements: "das", post_until: "adsImage", posting_date: "sadsa", posting_type: "asd", posting_updated: "ads", preferred_skills: "asdsa", process_date: "asds", residency_requirement: "adsad", salary_frequency: "asdsa", salary_range_from: "asdsadsa", salary_range_to: "asdasdas", title_code_no: "asdas", to_apply: "asdsa", work_location: "asdsa", work_location_1: "asdas")
        cell.configureCell(job: job)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

