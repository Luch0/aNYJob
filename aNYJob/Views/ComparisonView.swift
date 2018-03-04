//
//  ComparisonView.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import Charts

class ComparisonView: UIView {

    // For the container view, just add all the objects from the jobDetailTableViewCell and contrain them to inside the container view.
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.969, alpha: 1.00)
        return view
    }()
    
    lazy var barChart: BarChartView = {
        let barChart = BarChartView()
        return barChart
    }()
    
    public func updateBarChart(with array: [BaseSalary]) {
        var barEntries = [BarChartDataEntry]()
        for i in 0...50 {
            let dataEntry = BarChartDataEntry(x: Double(i+1), y: Double(array[i].base_salary)!)
            barEntries.append(dataEntry)
        }
        let dataSet = BarChartDataSet(values: barEntries, label: "Salaries")
        dataSet.colors = ChartColorTemplates.colorful()
        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
        barChart.chartDescription?.text = "Description goes here"
        barChart.notifyDataSetChanged()
    }
    
    lazy var comparisonTableView: UITableView = {
        let tv = UITableView()
        //create and register a cell
        tv.register(ComparisonTableViewCell.self, forCellReuseIdentifier: "ComparisonCell")
        tv.backgroundColor = .clear
        return tv
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
    
    private func setupViews() {
        //addSubview(containerView)
        addSubview(barChart)
        addSubview(comparisonTableView)
        
//        containerView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
//            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.2)
//            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
//        }
        
        barChart.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(0.5)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width)//.multipliedBy(0.9)
        }
        
        comparisonTableView.snp.makeConstraints { (make) in
            make.top.equalTo(barChart.snp.bottom)
            make.width.equalTo(self.safeAreaLayoutGuide.snp.width)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
