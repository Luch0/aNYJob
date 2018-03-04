//
//  ComparisonViewController.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import Charts

class ComparisonViewController: UIViewController {
    
    var sampleArray = [BaseSalary]() {
        didSet {
            comparisonView.comparisonTableView.reloadData()
            comparisonView.updateBarChart(with: sampleArray)
        }
    }
    
    var job: Job
    
    let comparisonView = ComparisonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadBaseSalaries()
        // Delegates
        comparisonView.comparisonTableView.dataSource = self
        comparisonView.comparisonTableView.delegate = self
        comparisonView.barChart.delegate = self
    }
    
    init(job: Job) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.view.addSubview(comparisonView)
        
    }
    
    private func loadBaseSalaries() {
        BaseSalaryAPIClient.manager.getOnlineBaseSlalaries(with: job.civil_service_title, completionHandler: {
            self.sampleArray = $0
        }, errorHandler: { print($0) })
    }
    
}
extension ComparisonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComparisonCell", for: indexPath) as! ComparisonTableViewCell
        
        let baseSalary = sampleArray[indexPath.row]
        
        cell.jobNameLabel.text = "\(baseSalary.title_description)"
        cell.salaryLabel.text = "$\(baseSalary.base_salary)"
        cell.agencyNameLabel.text = "\(baseSalary.agency_name)"
        cell.workLocationLabel.text = "\(baseSalary.work_location_borough ?? "Location N/A")"
        
        return cell
        
    }
    
    
}
extension ComparisonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO
        
    }
}

extension ComparisonViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
}
