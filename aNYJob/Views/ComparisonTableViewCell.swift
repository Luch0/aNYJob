//
//  ComparisonTableViewCell.swift
//  aNYJob
//
//  Created by Richard Crichlow on 3/3/18.
//  Copyright © 2018 aMigos. All rights reserved.
//

import UIKit
import SnapKit

class ComparisonTableViewCell: UITableViewCell {

    //title description
    lazy var jobNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pirate"
        Stylesheet.Objects.Labels.JobLabel.style(label: lb)
        return lb
    }()
    
    //base salary
    lazy var salaryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "$99,999"
        Stylesheet.Objects.Labels.SalaryLabel.style(label: lb)
        return lb
    }()
    
    //agency name
    lazy var agencyNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Department of Education"
        Stylesheet.Objects.Labels.AgencyNameLabel.style(label: lb)
        return lb
    }()
    
    //work location
    lazy var workLocationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Queens"
        Stylesheet.Objects.Labels.BoroughLabel.style(label: lb)
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "ComparisonCell")
        setupAndConstrainObjects()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAndConstrainObjects()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAndConstrainObjects()
    }
    
    private func setupAndConstrainObjects(){
        self.addSubview(jobNameLabel)
        self.addSubview(agencyNameLabel)
        self.addSubview(salaryLabel)
        self.addSubview(workLocationLabel)
        
        
        jobNameLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.snp.width).multipliedBy(0.7)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
        }
        agencyNameLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
            make.top.equalTo(jobNameLabel.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        salaryLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(jobNameLabel.snp.trailing)
        }
        workLocationLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.snp.width).multipliedBy(0.4)
            make.top.equalTo(salaryLabel.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(agencyNameLabel.snp.trailing)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
}
