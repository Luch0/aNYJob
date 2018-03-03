//
//  SearchViewController.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//


//https://data.cityofnewyork.us/resource/swhp-yxa4.json?$where=business_title%20like%20%27%25Cle%25%27

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    
    var jobs = [Job]()
    
    var filteredArr = [Job]() {
        didSet {
            searchView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJobs()
        configureNavBar()
        configureSearchView()
    }
    
    private func loadJobs() {
        guard let jsonJobs = JobsAPIClient.manager.getJobs(filename: "openJobsNYC", type: "json") else {
            print("Error loading jobs")
            return
        }
        self.jobs = jsonJobs
        self.filteredArr = jsonJobs
    }
    
    private func configureNavBar() {
        navigationItem.title = "Search"
    }
    
    private func configureSearchView() {
        view.addSubview(searchView)
        searchView.tableView.dataSource = self
        searchView.tableView.delegate = self
        searchView.searchBar.delegate = self
        searchView.boroughSegmentedControl.addTarget(self, action: #selector(boroughSegmentedControlValueChanged(sender:)), for: .valueChanged)
        searchView.jobTypeSegmentedControl.addTarget(self, action: #selector(jobTypeSegmentedControlValueChanged(sender:)), for: .valueChanged)
    }
    
    @objc private func boroughSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.filteredArr = self.jobs
            print("all")
        case 1:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("queens") }
            print("Q")
        case 2:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("manhattan") }
            print("M")
        case 3:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("brooklyn") }
            print("Broo")
        case 4:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("bronx") }
            print("Bronx")
        case 5:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("staten island") }
            print("SI")
        default:
            print("Error")
        }
        // 0 All
        // 1 Queens
        // 2 Manhattan
        // 3 Brooklyn
        // 4 Bronx
        // 5 SI
    }
    
    @objc private func jobTypeSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("All")
            self.filteredArr = self.jobs
        case 1:
            self.filteredArr = self.jobs.filter{ $0.full_time_part_time_indicator == "F" }
        case 2:
            self.filteredArr = self.jobs.filter{ $0.full_time_part_time_indicator == "P" }
        default:
            print("Error")
        }
        // 0 All
        // 1 Fulltime
        // 2 Parttime
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableViewCell
        let job = filteredArr[indexPath.row]
        cell.configureCell(job: job)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

