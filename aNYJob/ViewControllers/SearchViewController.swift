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
    
    var searchterm = "" {
        didSet {
            JobsAPIClient.manager.getOnlineJobs(with: searchterm, completionHandler: {
                self.filteredArr = $0
            }, errorHandler: { print($0) })
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
            print("All")
        case 1:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("queens") }
            print("Queens")
        case 2:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("manhattan") }
            print("Manhattan")
        case 3:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("brooklyn") }
            print("Brooklyn")
        case 4:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("bronx") }
            print("Bronx")
        case 5:
            self.filteredArr = self.jobs.filter{ $0.work_location.lowercased().contains("staten island") }
            print("Staten Island")
        default:
            print("Error")
        }
        if filteredArr.count > 0 {
            searchView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
    }
    
    @objc private func jobTypeSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("All")
            self.filteredArr = self.jobs
        case 1:
            print("Full Time")
            self.filteredArr = self.jobs.filter{ $0.full_time_part_time_indicator == "F" }
        case 2:
            print("Part Time")
            self.filteredArr = self.jobs.filter{ $0.full_time_part_time_indicator == "P" }
        default:
            print("Error")
        }
        if filteredArr.count > 0 {
            searchView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
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
        let job = jobs[indexPath.row]
        let detailViewController = JobDetailViewController(job: job)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchterm = searchBar.text!
    }
}

