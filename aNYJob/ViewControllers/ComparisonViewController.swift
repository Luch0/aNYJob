//
//  ComparisonViewController.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import Charts
import TableFlip

class ComparisonViewController: UIViewController {
    
    var salaries = [BaseSalary]() {
        didSet {
            comparisonView.comparisonTableView.reloadData()
            comparisonView.comparisonTableView.animate(animation: TableViewAnimation.Cell.fade(duration: 0.5))
            comparisonView.updateBarChart(with: salaries)
        }
    }
    
    var sortedArray = [BaseSalary]() {
        didSet {
            comparisonView.updateBarChart(with: sortedArray)
        }
    }
    
    var job: Job
    
    let comparisonView = ComparisonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadBaseSalaries()
        configureNavBar()
        // Delegates
        comparisonView.comparisonTableView.dataSource = self
        comparisonView.comparisonTableView.delegate = self
        comparisonView.barChart.delegate = self
    }
    
    private func configureNavBar() {
        let sortButton = UIBarButtonItem(image: #imageLiteral(resourceName: "decline"), style: .plain, target: self, action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc private func sortButtonTapped() {
        sortedArray = salaries[0...50].sorted(){ Double($0.base_salary)! > Double($1.base_salary)! }
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
            self.salaries = $0
        }, errorHandler: { print($0) })
    }
    
}
extension ComparisonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComparisonCell", for: indexPath) as! ComparisonTableViewCell
        cell.isUserInteractionEnabled = false
        let baseSalary = salaries[indexPath.row]
        
        cell.jobNameLabel.text = "\(baseSalary.title_description)"
        cell.salaryLabel.text = "$\(baseSalary.base_salary)"
        cell.agencyNameLabel.text = "\(baseSalary.agency_name)"
        cell.workLocationLabel.text = "\(baseSalary.work_location_borough ?? "Location N/A")"
        cell.selectionStyle = .none
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
        comparisonView.comparisonTableView.scrollToRow(at: IndexPath.init(row: Int(entry.x) - 1, section: 0) , at: .top, animated: true)
    }
}
