//
//  ComparisonViewController.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit

class ComparisonViewController: UIViewController {
    
    var sampleArray = [Job]() {
        didSet {
            comparisonView.comparisonTableView.reloadData()
        }
    }
    
    let comparisonView = ComparisonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Delegates
        comparisonView.comparisonTableView.dataSource = self
        comparisonView.comparisonTableView.delegate = self
    }
    
    private func setupView() {
        self.view.addSubview(comparisonView)
        
    }
    
}
extension ComparisonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComparisonCell", for: indexPath) as! ComparisonTableViewCell
        
        let aJob = sampleArray[indexPath.row]
        
        cell.jobNameLabel.text = " \(aJob.title_code_no)"
        cell.salaryLabel.text = "\(aJob.salary_range_from) - \(aJob.salary_range_to)"
        cell.agencyNameLabel.text = " \(aJob.agency)"
        cell.workLocationLabel.text = " \(aJob.work_location): \(aJob.work_location_1)"
        
        return cell
        
    }
    
    
}
extension ComparisonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO
        
    }
}
