//
//  SearchViewController.swift
//  aNYJob
//
//  Created by Reiaz Gafar on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//


//https://data.cityofnewyork.us/resource/swhp-yxa4.json?$where=business_title%20like%20%27%25Cle%25%27

import UIKit
import DZNEmptyDataSet

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    
    var allJobs = [Job]() {
        didSet {
            self.filteredArrToUse = self.allJobs
        }
    }
    var filteredByBoroughArr = [Job]() {
        didSet {
            self.filteredArrToUse = self.filteredByBoroughArr
        }
    }
    var filteredByJobTypeArr = [Job]() {
        didSet {
            self.filteredArrToUse = self.filteredByJobTypeArr
        }
    }
    var filterBySearchTerm = [Job]() {
        didSet {
            self.filteredArrToUse = self.filterBySearchTerm
        }
    }
    var filteredArrToUse = [Job]() {
        didSet {
            self.searchView.tableView.reloadData()
        }
    }
    
    var searchterm = "" {
        didSet {
            if searchterm == "" {
                JobsAPIClient.manager.getAllOnlineJobs(completionHandler: {
                    self.allJobs = $0
                }, errorHandler: { print($0) })
                return
            }
            
            if searchView.boroughSegmentedControl.selectedSegmentIndex <= 0 && searchView.jobTypeSegmentedControl.selectedSegmentIndex <= 0 {
                JobsAPIClient.manager.getOnlineJobs(with: searchterm, completionHandler: {
                    self.allJobs = $0
                }, errorHandler: { print($0) })
            } else {
                self.filterBySearchTerm = allJobs.filter{ $0.business_title.lowercased().contains(searchterm.lowercased()) }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllJobs()
        configureNavBar()
        configureSearchView()
        searchView.tableView.emptyDataSetSource = self
        searchView.tableView.emptyDataSetDelegate = self
        searchView.tableView.separatorStyle = .none
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if let _ = AuthUserService.manager.getCurrentUser() {
//            
//        } else {
//            let loginViewController = LoginVC()
//            present(loginViewController, animated: true, completion: nil)
//        }
//    }
    
    private func configureNavBar() {
        navigationItem.title = "Search"
    }
    
    private func loadAllJobs() {
        JobsAPIClient.manager.getAllOnlineJobs(completionHandler: {
            self.allJobs = $0
            self.filteredByBoroughArr = $0
            self.filteredByJobTypeArr = $0
            self.filteredByBoroughArr = $0
            self.filterBySearchTerm = $0
        }, errorHandler: { print($0) })
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
            self.filteredByBoroughArr = self.allJobs
            print("All")
        case 1:
            self.filteredByBoroughArr = self.allJobs.filter{ $0.work_location.lowercased().contains("queens") }
            print("Queens")
        case 2:
            self.filteredByBoroughArr = self.allJobs.filter{ $0.work_location.lowercased().contains("manhattan")  || $0.work_location.lowercased().contains("new york") }
            print("Manhattan")
        case 3:
            self.filteredByBoroughArr = self.allJobs.filter{ $0.work_location.lowercased().contains("brooklyn") }
            print("Brooklyn")
        case 4:
            self.filteredByBoroughArr = self.allJobs.filter{ $0.work_location.lowercased().contains("bronx") }
            print("Bronx")
        case 5:
            self.filteredByBoroughArr = self.allJobs.filter{ $0.work_location.lowercased().contains("s.i.") }
            print("Staten Island")
        default:
            print("Error")
        }
        if filteredByBoroughArr.count > 0 {
            searchView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
    }
    
    @objc private func jobTypeSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("All")
            self.filteredByJobTypeArr = self.filteredByBoroughArr
        case 1:
            print("Full Time")
            self.filteredByJobTypeArr = self.filteredByBoroughArr.filter{ $0.full_time_part_time_indicator == "F" }
        case 2:
            print("Part Time")
            self.filteredByJobTypeArr = self.filteredByBoroughArr.filter{ $0.full_time_part_time_indicator == "P" }
        default:
            print("Error")
        }
        if filteredByJobTypeArr.count > 0 {
            searchView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArrToUse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableViewCell
        let job = filteredArrToUse[indexPath.row]
        cell.configureCell(job: job)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let job = filteredArrToUse[indexPath.row]
        let detailViewController = JobDetailViewController(job: job)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchterm = searchBar.text!
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchterm = searchBar.text!
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        return EmptyStateView(emptyText: "No job information to display")
    }
}

